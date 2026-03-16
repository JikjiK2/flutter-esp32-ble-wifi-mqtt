import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

class AppLogger {
  static void log(String message, {String tag = 'APP', LogLevel level = LogLevel.info}) {
    if (!kDebugMode) return;

    final timestamp = DateTime.now().toIso8601String().split('T').last.substring(0, 12);
    final icon = _getIcon(level);
    
    final colorCode = _getColorCode(level);
    
    debugPrint('\x1B[$colorCode[$icon $tag] [$timestamp] $message\x1B[0m');
  }

  static String _getIcon(LogLevel level) {
    switch (level) {
      case LogLevel.debug: return '🔍';
      case LogLevel.info: return '💡';
      case LogLevel.warning: return '⚠️';
      case LogLevel.error: return '❌';
    }
  }

  static String _getColorCode(LogLevel level) {
    switch (level) {
      case LogLevel.debug: return '34m';
      case LogLevel.info: return '32m';
      case LogLevel.warning: return '33m';
      case LogLevel.error: return '31m';
    }
  }

  static void d(String msg, {String tag = 'DEBUG'}) => log(msg, tag: tag, level: LogLevel.debug);
  static void i(String msg, {String tag = 'INFO'}) => log(msg, tag: tag, level: LogLevel.info);
  static void w(String msg, {String tag = 'WARN'}) => log(msg, tag: tag, level: LogLevel.warning);
  static void e(String msg, {String tag = 'ERROR'}) => log(msg, tag: tag, level: LogLevel.error);
}
