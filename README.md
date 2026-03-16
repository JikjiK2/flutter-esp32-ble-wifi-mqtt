# flutter_esp32_ble_wifi

기능별 클린 아키텍처 구조와 Riverpod을 활용한 상태 관리를 활용한 ESP32 제어 앱

### 주요 기능   
- **기기 제어**: BLE, WiFi 및 MQTT 프로토콜을 전환하여 다양한 제어 환경을 제공합니다.
- **강력한 보안 및 인증**: Google OAuth2 기반의 사용자 인증과 SSL/TLS(MQTTS) 암호화 통신으로 종단 간 보안을 보장합니다.
- **실시간 알림 서비스**: 서버 측 룰 엔진과 연동되어 임계치 도달 및 기기 이상 발생 시 Firebase(FCM) 푸시 알림을 즉시 수신합니다.
- **클린 아키텍처 설계**: 기능별 레이어 분리와 Riverpod 상태 관리를 통해 복잡한 비동기 통신 로직을 안정적으로 처리합니다.

### 통신 모드 및 네트워크 관리
- 앱은 현재 네트워크 상태를 감시하며, 사용자의 선택에 따라 통신 프로토콜(Bluetooth, HTTP, MQTT)을 동적으로 전환합니다.
- 인터넷이 없는 ESP32 AP 모드 연결 시, OS가 연결을 해제하지 않도록 프로세스 레벨의 네트워크 바인딩을 수행합니다.

### 보안 통신 (MQTTS)
- MQTT 연결 시 OpenSSL로 구축된 자체 서명 인증서를 내부 스토리지에서 로드하여 서버와의 TLS 핸드쉐이크를 수행합니다.
- RTC가 없는 하드웨어를 위해 접속 전 SNTP 시간 동기화를 선행하여 인증서 유효 기간 검증 실패를 방지합니다.

### 📂 프로젝트 주요 디렉토리 구조
```
lib
├── features
│   ├── auth                # 사용자 인증 (Google Sign-In, Firebase)
│   ├── farm                # 핵심 비즈니스 로직 (장치 상태, 센서 제어)
│   │   ├── data            # data sources (API, MQTT 호출) 및 repository 구현
│   │   ├── domain          # entity 및 UseCase 정의
│   │   └── presentation    # Riverpod 프로바이더 및 UI 화면
│   ├── ble                 # BLE 연결 및 설정
│   ├── wifi                # WiFi 스캔 및 ESP32 네트워크 구성
│   └── mqtt                # MQTT 브로커 통신 서비스
├── core                    # 공통 유틸리티 (Network, Router, Theme)
│   ├── network             # API 클라이언트 및 통신 가이드
│   ├── router              # GoRouter 기반 네비게이션 설정
│   └── infrastructure      # 인프라 공통 로직
├── esp32
│   └── esp32_ble_wifi_mqtt # ESP32 펌웨어 소스 코드 (.ino)
└── main.dart
```

### 주요 펌웨어 기능 (`esp32_ble_wifi_mqtt.ino`)

- **멀티 프로토콜 지원**: BLE, WiFi, MQTT를 사용자가 상황에 맞게 통신 모드를 선택합니다.
- **데이터 영속화**: `Preferences` 라이브러리를 통해 WiFi SSID/PW 및 MQTT 설정 정보를 비휘발성 메모리에 저장하고 복구합니다.
- **실시간 상태 동기화**: `ArduinoJson`을 활용하여 센서 데이터(온도, 습도, 조도)를 규격화된 JSON 포맷으로 발행 및 수신합니다.
- **보안 핸드쉐이크**: `WiFiClientSecure`를 사용하여 서버와 안전한 MQTTS 연결을 수립하며, 접속 전 SNTP 시간 동기화를 수행합니다.

### 하드웨어 설정
- **ESP32 WROOM-32E 개발 보드**
- DHT11 (온도/습도 센서)
- 가변 저항 모듈 (3핀: VCC, GND, OUT)
- RGB LED 모듈 (4핀: R, G, B, GND)

| **Component**  | **ESP32 Pin** | **Note** |
| --- | --- | --- |
| **DHT11** (온도/습도 센서) | GPIO **13** | 온도 및 습도 측정 |
| **가변 저항 모듈** | GPIO **35**  | 가변저항을 이용한 밝기 조절 |
| RGB LED 모듈 (**Red**) | GPIO **23**  | PWM 제어 |
| RGB LED 모듈 (**Green**) | GPIO **22** | PWM 제어 |
| RGB LED 모듈 (**Blue**) | GPIO **21** | PWM 제어 |
