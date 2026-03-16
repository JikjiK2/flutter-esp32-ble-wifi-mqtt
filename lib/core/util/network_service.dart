import 'dart:io';
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_service.g.dart';

@riverpod
NetworkService networkService(Ref ref) => NetworkService();

class NetworkService {
  Future<bool> waitForInternet({int maxRetries = 20}) async {
    int retryCount = 0;
    
    while (retryCount < maxRetries) {
      if (await isInternetAvailable()) {
        return true;
      }
      retryCount++;
      await Future.delayed(const Duration(seconds: 1));
    }
    return false;
  }

  Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 1));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
