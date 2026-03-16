import 'dart:convert';

class AuthUtils {
  static String? getEmailFromToken(String? token) {
    if (token == null || token.isEmpty) return null;
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      
      final payload = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
      final Map<String, dynamic> data = json.decode(payload);
      
      return data['sub'] as String?;
    } catch (e) {
      return null;
    }
  }
}
