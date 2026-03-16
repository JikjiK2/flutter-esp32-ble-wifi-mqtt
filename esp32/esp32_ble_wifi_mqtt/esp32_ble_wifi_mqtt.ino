#include "secrets.h"
#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include <WebServer.h>
#include <WebSocketsServer.h>
#include <ESPmDNS.h>
#include <ArduinoJson.h>
#include <Preferences.h>
#include <DHT.h>
#include <time.h>

namespace Config {
    const int DHT_PIN = 13;
    const int POT_PIN = 35;
    const int RED_PIN = 23;
    const int GREEN_PIN = 22;
    const int BLUE_PIN = 21;
    const int PWM_FREQ = 5000;
    const int PWM_RES = 8;
    const int BOOT_BUTTON_PIN = 0;
}

enum CommMode {
    MODE_WIFI_LOCAL = 0, MODE_MQTT = 1, MODE_BLE = 2
};
const char *MODE_NAMES[] = {"WIFI_LOCAL", "MQTT", "BLE"};

struct DeviceState {
    float temp = 0, hum = 0;
    int brightness = 128;
    int ledMode = 0;
    int manualR = 255, manualG = 255, manualB = 255;
    int appBrightness = 128;
    int brightMode = 0;
    bool isOn = true;
    bool connected = false;
    int commMode = MODE_WIFI_LOCAL;
    bool isSystemAction = false;
};

DeviceState g_state;
SemaphoreHandle_t xMutex = NULL;
DHT dht(Config::DHT_PIN, DHT11);
Preferences prefs;

WiFiClient wifiClient;
WiFiClientSecure secureClient;
PubSubClient mqttClient;
WebServer server(80);
WebSocketsServer webSocket = WebSocketsServer(81);
BLECharacteristic *pTxChar = nullptr;

String saved_ssid, saved_pass, saved_mqtt_raw;
String saved_mqtt_host;
int saved_mqtt_port = 1883;
String device_id;
String owner_email = "";
String status_topic, control_topic;

bool should_restart_ble_adv = false;

void updateTopics() {
    status_topic = "smartfarm/" + device_id + "/status";
    control_topic = "smartfarm/" + device_id + "/control";
}

void setLED(int r, int g, int b) {
    ledcWrite(Config::RED_PIN, r);
    ledcWrite(Config::GREEN_PIN, g);
    ledcWrite(Config::BLUE_PIN, b);
}

void syncTime() {
    Serial.print("⏳ [TIME] Syncing time for SSL...");
    configTime(0, 0, "pool.ntp.org", "time.google.com");
    time_t now = time(nullptr);
    int retry = 0;
    while (now < 8 * 3600 * 2 && retry < 10) {
        delay(500);
        Serial.print(".");
        now = time(nullptr);
        retry++;
    }
    Serial.println("\n✅ [TIME] Time synced.");
}

void parseMqttAddress(String addr) {
    int colonIdx = addr.indexOf(':');
    if (colonIdx != -1) {
        saved_mqtt_host = addr.substring(0, colonIdx);
        saved_mqtt_port = addr.substring(colonIdx + 1).toInt();
    } else {
        saved_mqtt_host = addr;
        saved_mqtt_port = 1883;
    }
}

void applyMqttConfig() {
    parseMqttAddress(saved_mqtt_raw);
    if (saved_mqtt_port == 8883) {
        Serial.printf("🔒 [MQTT] Applying Secure Mode (8883) for %s\n", saved_mqtt_host.c_str());
        syncTime();
        secureClient.setCACert(root_ca);
        if (saved_mqtt_host.startsWith("192.") || saved_mqtt_host.startsWith("10.")) {
            secureClient.setInsecure();
        }
        mqttClient.setClient(secureClient);
    } else {
        Serial.printf("🔓 [MQTT] Applying Normal Mode (%d) for %s\n", saved_mqtt_port,
                      saved_mqtt_host.c_str());
        mqttClient.setClient(wifiClient);
    }
    mqttClient.setServer(saved_mqtt_host.c_str(), saved_mqtt_port);
    mqttClient.setCallback(mqttCallback);
}

void updateLED_Output() {
    if (g_state.isSystemAction) return;
    if (!g_state.isOn) {
        setLED(0, 0, 0);
        return;
    }
    int b = (g_state.brightMode == 1) ? g_state.appBrightness : map(analogRead(Config::POT_PIN), 0,
                                                                    4095, 0, 255);
    g_state.brightness = b;
    int r = g_state.manualR, gr = g_state.manualG, bl = g_state.manualB;
    if (g_state.ledMode == 0) {
        if (g_state.temp < 18) {
            r = 0;
            gr = 0;
            bl = 255;
        }
        else if (g_state.temp < 28) {
            r = 0;
            gr = 255;
            bl = 0;
        }
        else {
            r = 255;
            gr = 0;
            bl = 0;
        }
    }
    setLED(map(r, 0, 255, 0, b), map(gr, 0, 255, 0, b), map(bl, 0, 255, 0, b));
}

void sendState() {
    if (xMutex == NULL) return;
    JsonDocument doc;
    if (xSemaphoreTake(xMutex, pdMS_TO_TICKS(50))) {
        doc["temp"] = g_state.temp;
        doc["hum"] = g_state.hum;
        doc["brightness"] = g_state.brightness;
        doc["ledMode"] = g_state.ledMode;
        doc["brightMode"] = g_state.brightMode;
        doc["isOn"] = g_state.isOn;
        doc["r"] = g_state.manualR;
        doc["g"] = g_state.manualG;
        doc["b"] = g_state.manualB;
        if (WiFi.status() == WL_CONNECTED) doc["rssi"] = WiFi.RSSI();
        xSemaphoreGive(xMutex);
    }
    String out;
    serializeJson(doc, out);

    if (g_state.commMode == MODE_BLE && pTxChar && g_state.connected) {
        pTxChar->setValue(out.c_str());
        pTxChar->notify();
    } else if (g_state.commMode == MODE_WIFI_LOCAL && g_state.connected) {
        webSocket.broadcastTXT(out);
    } else if (g_state.commMode == MODE_MQTT && mqttClient.connected()) {
        mqttClient.publish(status_topic.c_str(), out.c_str());
    }
}

void performWifiScanMqtt() {
    Serial.println("🔍 [MQTT] Remote WiFi scan requested...");
    int n = WiFi.scanNetworks();
    JsonDocument doc;
    doc["type"] = "wifi_list";
    JsonArray networks = doc["networks"].to<JsonArray>();
    for (int i = 0; i < n; ++i) {
        JsonObject obj = networks.add<JsonObject>();
        obj["ssid"] = WiFi.SSID(i);
        obj["rssi"] = WiFi.RSSI(i);
        obj["secure"] = (WiFi.encryptionType(i) != WIFI_AUTH_OPEN);
    }
    String out;
    serializeJson(doc, out);
    mqttClient.publish(status_topic.c_str(), out.c_str());
    WiFi.scanDelete();
    Serial.printf("✅ [MQTT] Sent %d networks to app\n", n);
}

void factoryReset() {
    Serial.println("\n🧹 [SYSTEM] Factory Reset Initiated...");
    g_state.isSystemAction = true;
    prefs.begin("wifi_config", false);
    prefs.clear();
    prefs.end();
    prefs.begin("mood_lamp", false);
    prefs.clear();
    prefs.end();
    WiFi.disconnect(true, true);
    Serial.println("✅ [SYSTEM] All data cleared. Rebooting...");
    delay(1000);
    ESP.restart();
}

void webSocketEvent(uint8_t num, WStype_t type, uint8_t *payload, size_t length) {
    switch (type) {
        case WStype_DISCONNECTED:
            Serial.printf("[%u] 🔴 WebSocket Disconnected\n", num);
            if (g_state.commMode == MODE_WIFI_LOCAL) g_state.connected = false;
            break;
        case WStype_CONNECTED: {
            IPAddress ip = webSocket.remoteIP(num);
            Serial.printf("[%u] 🟢 WebSocket Connected from %d.%d.%d.%d\n", num, ip[0], ip[1], ip[2],
                          ip[3]);
            if (g_state.commMode == MODE_WIFI_LOCAL) g_state.connected = true;
            sendState();
        }
            break;
        case WStype_TEXT:
            Serial.printf("[%u] 📥 WS RX: %s\n", num, payload);
            mqttCallback(nullptr, payload, length);
            break;
    }
}

void mqttCallback(char *topic, byte *payload, unsigned int length) {
    char msg[length + 1];
    memcpy(msg, payload, length);
    msg[length] = '\0';
    Serial.printf("📥 [MSG] Processing: %s\n", msg);
    JsonDocument d;
    if (deserializeJson(d, msg) != DeserializationError::Ok) return;

    if (xSemaphoreTake(xMutex, portMAX_DELAY)) {
        if (d.containsKey("reset") && d["reset"] == true) { factoryReset(); }
        if (d.containsKey("cmd")) {
            String cmd = d["cmd"].as<String>();
            if (cmd == "reset") factoryReset();
            if (cmd == "reboot") ESP.restart();
            if (cmd == "scan_wifi") { performWifiScanMqtt(); }
        }
        if (d.containsKey("command")) {
            String command = d["command"].as<String>();
            if (command == "scan_wifi") { performWifiScanMqtt(); }
            if (command == "reconfigure") {
                if (d.containsKey("ssid")) {
                    String s = d["ssid"].as<String>();
                    String p = d["password"].as<String>();
                    prefs.begin("wifi_config", false);
                    prefs.putString("ssid", s);
                    prefs.putString("password", p);
                    prefs.end();
                    Serial.printf("🔄 [MQTT] Reconfigured WiFi: %s. Rebooting...\n", s.c_str());
                    delay(500);
                    ESP.restart();
                }
            }
        }
        if (d.containsKey("isOn")) g_state.isOn = d["isOn"].as<bool>();
        if (d.containsKey("ledMode")) g_state.ledMode = d["ledMode"].as<int>();
        if (d.containsKey("brightness")) g_state.appBrightness = d["brightness"].as<int>();
        if (d.containsKey("brightMode")) g_state.brightMode = d["brightMode"].as<int>();
        if (d.containsKey("r")) g_state.manualR = d["r"].as<int>();
        if (d.containsKey("g")) g_state.manualG = d["g"].as<int>();
        if (d.containsKey("b")) g_state.manualB = d["b"].as<int>();
        updateLED_Output();
        xSemaphoreGive(xMutex);
    }
    sendState();
}

class MyBLECallbacks : public BLEServerCallbacks, public BLECharacteristicCallbacks {
    void onConnect(BLEServer *pS) override {
        g_state.connected = true;
        Serial.println("🔵 [BLE] Connected");
    }

    void onDisconnect(BLEServer *pS) override {
        g_state.connected = false;
        Serial.println("🔴 [BLE] Disconnected");
        should_restart_ble_adv = true;
    }

    void onWrite(BLECharacteristic *pC) override {
        String rxValue = pC->getValue();
        JsonDocument d;
        deserializeJson(d, rxValue);
        if (xSemaphoreTake(xMutex, portMAX_DELAY)) {
            if (d.containsKey("isOn")) g_state.isOn = d["isOn"].as<bool>();
            if (d.containsKey("ledMode")) g_state.ledMode = d["ledMode"].as<int>();
            if (d.containsKey("r")) g_state.manualR = d["r"].as<int>();
            if (d.containsKey("g")) g_state.manualG = d["g"].as<int>();
            if (d.containsKey("b")) g_state.manualB = d["b"].as<int>();
            if (d.containsKey("brightness")) g_state.appBrightness = d["brightness"].as<int>();
            if (d.containsKey("brightMode")) g_state.brightMode = d["brightMode"].as<int>();
            updateLED_Output();
            xSemaphoreGive(xMutex);
        }
        sendState();
    }
};

void loadSettings() {
    prefs.begin("mood_lamp", true);
    g_state.commMode = prefs.getInt("mode", MODE_WIFI_LOCAL);
    g_state.ledMode = prefs.getInt("ledMode", 0);
    g_state.manualR = prefs.getInt("manualR", 255);
    g_state.manualG = prefs.getInt("manualG", 255);
    g_state.manualB = prefs.getInt("manualB", 255);
    g_state.appBrightness = prefs.getInt("bri", 128);
    g_state.brightMode = prefs.getInt("briM", 0);
    g_state.isOn = prefs.getBool("isOn", true);
    device_id = prefs.getString("dev_id", "");
    prefs.end();

    if (device_id == "" || device_id == "NULL") {
        uint8_t mac[6];
        WiFi.macAddress(mac);
        char macStr[7];
        snprintf(macStr, sizeof(macStr), "%02X%02X%02X", mac[3], mac[4], mac[5]);
        device_id = "esp32_" + String(macStr);
    }

    prefs.begin("wifi_config", true);
    saved_ssid = prefs.getString("ssid", "");
    saved_pass = prefs.getString("password", "");
    saved_mqtt_raw = prefs.getString("mqtt_ip", "");
    owner_email = prefs.getString("owner_email", "");
    prefs.end();
}

void setup() {
    Serial.begin(115200);
    xMutex = xSemaphoreCreateMutex();
    ledcAttach(Config::RED_PIN, Config::PWM_FREQ, Config::PWM_RES);
    ledcAttach(Config::GREEN_PIN, Config::PWM_FREQ, Config::PWM_RES);
    ledcAttach(Config::BLUE_PIN, Config::PWM_FREQ, Config::PWM_RES);
    pinMode(Config::BOOT_BUTTON_PIN, INPUT_PULLUP);
    dht.begin();

    loadSettings();
    updateTopics();

    Serial.println("\n====================================");
    Serial.println("🚀 SMART FARM ULTIMATE STARTUP");
    Serial.printf("📍 Device ID : %s\n", device_id.c_str());
    Serial.printf("👤 Owner: %s\n", owner_email == "" ? "Not Set" : owner_email.c_str());
    Serial.printf("📡 Active Mode: %s\n", MODE_NAMES[g_state.commMode]);
    if (g_state.commMode != MODE_BLE) {
        Serial.printf("🌐 Target WiFi: %s\n", saved_ssid == "" ? "Not Set" : saved_ssid.c_str());
        if (g_state.commMode == MODE_MQTT)
            Serial.printf("☁️ MQTT Broker: %s\n", saved_mqtt_raw == "" ? "Not Set"
                                                                       : saved_mqtt_raw.c_str());
    }
    Serial.println("====================================\n");

    if (g_state.commMode == MODE_BLE) {
        BLEDevice::init(device_id.c_str());
        BLEServer *pS = BLEDevice::createServer();
        MyBLECallbacks *cb = new MyBLECallbacks();
        pS->setCallbacks(cb);
        BLEService *pSv = pS->createService("4fafc201-1fb5-459e-8fcc-c5c9c331914b");
        pTxChar = pSv->createCharacteristic("cba1d466-344c-4be3-ab3f-189f80dd7518",
                                            BLECharacteristic::PROPERTY_NOTIFY |
                                            BLECharacteristic::PROPERTY_READ);
        pTxChar->addDescriptor(new BLE2902());
        BLECharacteristic *pRx = pSv->createCharacteristic("beb5483e-36e1-4688-b7f5-ea07361b26a8",
                                                           BLECharacteristic::PROPERTY_WRITE);
        pRx->setCallbacks(cb);
        pSv->start();
        pS->getAdvertising()->start();
    } else {
        WiFi.mode(WIFI_AP_STA);
        WiFi.softAP((device_id + "_Setup").c_str());
        if (saved_ssid != "") {
            Serial.printf("🌐 [WIFI] Attempting auto-connect to: %s\n", saved_ssid.c_str());
            WiFi.begin(saved_ssid.c_str(), saved_pass.c_str());
        }

        server.on("/setup", HTTP_POST, []() {
            String body = server.arg("plain");
            Serial.println("\n📥 [SETUP] Received configuration from App");
            JsonDocument doc;
            deserializeJson(doc, body);

            if (doc.containsKey("ssid")) {
                String s = doc["ssid"].as<String>();
                String p = doc["password"].as<String>();
                String m = doc.containsKey("mqtt_broker") ? doc["mqtt_broker"].as<String>() : "";
                String e = doc.containsKey("owner_email") ? doc["owner_email"].as<String>() : "";

                Serial.printf("📡 [SETUP] WiFi: %s, Owner: %s\n", s.c_str(), e.c_str());

                prefs.begin("wifi_config", false);
                prefs.putString("ssid", s);
                prefs.putString("password", p);
                if (m != "") {
                    prefs.putString("mqtt_ip", m);
                    saved_mqtt_raw = m;
                }
                if (e != "") {
                    prefs.putString("owner_email", e);
                    owner_email = e;
                }
                prefs.end();

                if (doc.containsKey("device_id")) {
                    String d = doc["device_id"].as<String>();
                    Serial.printf("🆔 [SETUP] Set Device ID: %s\n", d.c_str());
                    prefs.begin("mood_lamp", false);
                    prefs.putString("dev_id", d);
                    prefs.end();
                    device_id = d;
                    updateTopics();
                }

                Serial.printf("🌐 [WIFI] Connecting to %s...\n", s.c_str());
                applyMqttConfig();
                WiFi.disconnect();
                delay(100);
                WiFi.begin(s.c_str(), p.c_str());
            }
            server.send(200, "application/json", "{\"status\":\"success\"}");
        });

        server.on("/scan", HTTP_GET, []() {
            Serial.println("🔍 [WIFI] Scanning nearby networks...");
            int n = WiFi.scanNetworks();
            Serial.printf("🔍 [WIFI] Found %d networks\n", n);
            JsonDocument doc;
            JsonArray root = doc.to<JsonArray>();
            for (int i = 0; i < n; ++i) {
                JsonObject obj = root.add<JsonObject>();
                obj["ssid"] = WiFi.SSID(i);
                obj["rssi"] = WiFi.RSSI(i);
                obj["secure"] = (WiFi.encryptionType(i) != WIFI_AUTH_OPEN);
            }
            String response;
            serializeJson(doc, response);
            server.send(200, "application/json", response);
            WiFi.scanDelete();
        });

        server.on("/wifi_status", HTTP_GET, []() {
            JsonDocument doc;
            bool connected = (WiFi.status() == WL_CONNECTED);
            doc["connected"] = connected;
            doc["ip"] = WiFi.localIP().toString();
            String r;
            serializeJson(doc, r);
            server.send(200, "application/json", r);
        });

        server.on("/mqtt_status", HTTP_GET, []() {
            JsonDocument doc;
            bool wConnected = (WiFi.status() == WL_CONNECTED);
            bool mConnected = mqttClient.connected();
            doc["wifi_connected"] = wConnected;
            doc["mqtt_connected"] = mConnected;
            doc["ip"] = WiFi.localIP().toString();
            String r;
            serializeJson(doc, r);
            server.send(200, "application/json", r);
        });

        server.on("/reset", HTTP_POST, []() {
            Serial.println("🧹 [HTTP] Factory Reset request received via Local WiFi");
            server.send(200, "application/json",
                        "{\"status\":\"success\",\"message\":\"Device is resetting...\"}");
            delay(1000);
            factoryReset();
        });

        server.begin();
        if (MDNS.begin(device_id.c_str())) MDNS.addService("http", "tcp", 80);

        if (g_state.commMode == MODE_WIFI_LOCAL) {
            webSocket.begin();
            webSocket.onEvent(webSocketEvent);
            Serial.println("🌐 [WIFI] WebSocket Server started on port 81");
        } else if (g_state.commMode == MODE_MQTT && saved_mqtt_raw != "") {
            applyMqttConfig();
        }
    }

    xTaskCreate([](void *p) {
        for (;;) {
            float t = dht.readTemperature();
            float h = dht.readHumidity();
            if (!isnan(t)) {
                if (xSemaphoreTake(xMutex, 100)) {
                    g_state.temp = t;
                    g_state.hum = h;
                    xSemaphoreGive(xMutex);
                }
            }
            if (xSemaphoreTake(xMutex, 100)) {
                updateLED_Output();
                xSemaphoreGive(xMutex);
            }
            vTaskDelay(pdMS_TO_TICKS(100));
        }
    }, "Ctrl", 4096, NULL, 2, NULL);

    xTaskCreate([](void *p) {
        for (;;) {
            sendState();
            vTaskDelay(pdMS_TO_TICKS(5000));
        }
    }, "Tel", 4096, NULL, 1, NULL);
}

void loop() {
    if (g_state.commMode == MODE_BLE && should_restart_ble_adv) {
        should_restart_ble_adv = false;
        delay(500); 
        BLEDevice::startAdvertising();
        Serial.println("🔄 [BLE] Advertising Restarted from main loop");
    }

    if (g_state.commMode != MODE_BLE) {
        server.handleClient();

        static int lastWifiStatus = -1;
        int currentWifiStatus = WiFi.status();
        if (currentWifiStatus != lastWifiStatus) {
            if (currentWifiStatus == WL_CONNECTED) {
                Serial.printf("✅ [WIFI] Connected! IP Address: %s\n",
                              WiFi.localIP().toString().c_str());
            } else if (currentWifiStatus == WL_NO_SSID_AVAIL) {
                Serial.println("❌ [WIFI] Target SSID not found.");
            } else if (currentWifiStatus == WL_CONNECT_FAILED) {
                Serial.println("❌ [WIFI] Connection failed (Check password).");
            } else if (currentWifiStatus == WL_DISCONNECTED) {
                Serial.println("⚠️ [WIFI] Disconnected.");
            }
            lastWifiStatus = currentWifiStatus;
        }

        if (g_state.commMode == MODE_WIFI_LOCAL) webSocket.loop();
        if (g_state.commMode == MODE_MQTT) {
            if (WiFi.status() == WL_CONNECTED && !mqttClient.connected()) {
                static unsigned long lastM = 0;
                if (millis() - lastM > 5000) {
                    lastM = millis();
                    Serial.printf("☁️ [MQTT] Attempting connection to Broker: %s:%d\n",
                                  saved_mqtt_host.c_str(), saved_mqtt_port);
                    String composite_pass = owner_email + "|" + DEVICE_SECRET;
                    if (mqttClient.connect(device_id.c_str(), device_id.c_str(),
                                           composite_pass.c_str())) {
                        mqttClient.subscribe(control_topic.c_str());
                        Serial.println("✅ [MQTT] Connected to Broker successfully.");
                    } else {
                        Serial.printf("❌ [MQTT] Connection failed, rc=%d (Retry in 5s)\n",
                                      mqttClient.state());
                    }
                }
            }
            mqttClient.loop();
        }
    }

    if (digitalRead(Config::BOOT_BUTTON_PIN) == LOW) {
        g_state.isSystemAction = true;
        unsigned long start = millis();
        bool nextModeBlink = false;
        bool resetBlink = false;

        while (digitalRead(Config::BOOT_BUTTON_PIN) == LOW) {
            unsigned long dur = millis() - start;
            if (dur > 5000) {
                if (!resetBlink) {
                    Serial.println("⚠️ Release now to FACTORY RESET");
                    resetBlink = true;
                }
                setLED(255, 0, 0);
                delay(100);
                setLED(0, 0, 0);
                delay(100);
            } else if (dur > 2000) {
                int next = (g_state.commMode + 1) % 3;
                if (!nextModeBlink) {
                    Serial.printf("🔄 Release now to change to %s\n", MODE_NAMES[next]);
                    nextModeBlink = true;
                }
                if (next == MODE_WIFI_LOCAL) setLED(0, 255, 0);
                else if (next == MODE_MQTT) setLED(255, 255, 255);
                else setLED(0, 0, 255);
                delay(250);
                setLED(0, 0, 0);
                delay(250);
            }
            delay(10);
        }

        unsigned long total = millis() - start;
        if (total > 5000) factoryReset();
        else if (total > 2000) {
            g_state.commMode = (g_state.commMode + 1) % 3;
            prefs.begin("mood_lamp", false);
            prefs.putInt("mode", g_state.commMode);
            prefs.end();
            Serial.printf("✅ [SYSTEM] Mode changed to %s. Restarting...\n",
                          MODE_NAMES[g_state.commMode]);
            delay(500);
            ESP.restart();
        }
        g_state.isSystemAction = false;
    }
}
