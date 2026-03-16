class MqttTopics {
  static const String root = "smartfarm";

  static const String allStatus = "$root/+/status";

  static String deviceStatus(String deviceId) => "$root/$deviceId/status";

  static String deviceControl(String deviceId) => "$root/$deviceId/control";

  static String? extractDeviceId(String topic) {
    final parts = topic.split('/');
    if (parts.length >= 2 && parts[0] == root) {
      return parts[1];
    }
    return null;
  }
}
