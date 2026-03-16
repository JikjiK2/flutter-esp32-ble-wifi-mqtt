import 'dart:async';
import 'package:location/location.dart' as loc;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gps_service.g.dart';

@riverpod
GpsService gpsService(Ref ref) => GpsService();

class GpsService {
  final loc.Location _location = loc.Location();

  Future<bool> ensureGpsEnabled() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
    }
    return serviceEnabled;
  }

  Future<bool> isGpsEnabled() => _location.serviceEnabled();
}
