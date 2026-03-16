import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("📩 [Background Message] ID: ${message.messageId}");
}

void _onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse) {
  final String? payload = notificationResponse.payload;
  if (payload != null) {
    debugPrint('🖱️ [Local Notification Clicked] payload: $payload');
  }
}

class FcmHelper {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel', 
    'High Importance Notifications', 
    description: '이 채널은 중요한 알림에 사용됩니다.', 
    importance: Importance.max, 
  );

  static Future<void> initialize() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(alert: true, badge: true, sound: true);

    String? token = await messaging.getToken();
    if (token != null) debugPrint('🚀 [FCM TOKEN]: $token');

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _setupLocalNotifications();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      if (notification != null && !kIsWeb) {
        _localNotificationsPlugin.show(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              _channel.id,
              _channel.name,
              channelDescription: _channel.description,
              icon: '@mipmap/ic_launcher', 
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('🖱️ [FCM Notification Clicked] data: ${message.data}');
    });
  }

  static Future<void> registerTokenToServer(Dio dio) async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        final String platform = Platform.isAndroid ? "android" : "ios";
        await dio.post("/notifications/register-token", data: {
          "token": token,
          "platform": platform,
        });
        debugPrint('✅ [FCM] Token registered to server successfully.');
      }
    } catch (e) {
      debugPrint('❌ [FCM] Failed to register token to server: $e');
    }
  }

  static Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _localNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }
}
