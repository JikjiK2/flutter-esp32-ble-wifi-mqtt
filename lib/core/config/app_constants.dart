import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String get baseUrl =>
      dotenv.get('BASE_URL', fallback: 'http://localhost:8000');
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  static String get mqttHost => dotenv.get('MQTT_HOST', fallback: 'localhost');

  static int get mqttPort =>
      int.parse(dotenv.get('MQTT_PORT', fallback: '8883'));

  static String get mqttBaseUrl => "$mqttHost:$mqttPort";

  static const String mqttStatusTopic = "smartfarm/+/status";
  static const String mqttControlTopicPrefix = "smartfarm";
  static const String mqttClientIdPrefix = "fltr_";

  static const Duration mqttConnectTimeout = Duration(seconds: 10);
  static const int mqttKeepAlivePeriod = 30;

  static const String deviceSetupBaseUrl = "http://192.168.4.1";
  static const String deviceSsidPrefix = "esp32_";

  static const int deviceHttpRetryCount = 2;
  static const Duration deviceHttpTimeoutShort = Duration(seconds: 2);
  static const Duration deviceHttpTimeoutMedium = Duration(seconds: 4);
  static const Duration deviceHttpTimeoutLong = Duration(seconds: 8);
  static const Duration deviceHttpRetryDelay = Duration(milliseconds: 500);

  static const String esp32NamePrefix = "esp32";
  static const String bleServiceUuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  static const String bleCharUuidRx = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  static const String bleCharUuidTx = "cba1d466-344c-4be3-ab3f-189f80dd7518";

  static const String authPrefix = 'Bearer ';
  static const String apiDevices = "/devices/";
  static const String apiToken = "/auth/token";
  static const String apiRegister = "/auth/register";
  static const String apiSensorsLatest = '/sensors/latest/';
  static const String apiSensorsHistory = '/sensors/history/';
  static const String apiConfigMqtt = '/config/mqtt';
  static const String apiRules = '/rules/';
  static const String apiNotificationsRegister =
      '/notifications/register-token';

  static const Duration splashDelay = Duration(seconds: 2);
  static const Duration toastDuration = Duration(seconds: 3);
  static const double borderRadius = 12.0;
}
