import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_esp32_ble_wifi/features/ble/domain/entities/ble_device_entity.dart';

class BleDeviceModel {
  final String remoteId;
  final String advName;
  final String platformName;
  final int rssi;

  BleDeviceModel({
    required this.remoteId,
    required this.advName,
    required this.platformName,
    required this.rssi,
  });

  factory BleDeviceModel.fromScanResult(ScanResult result) {
    return BleDeviceModel(
      remoteId: result.device.remoteId.toString(),
      advName: result.advertisementData.advName,
      platformName: result.device.platformName,
      rssi: result.rssi,
    );
  }

  BleDevice toEntity() {
    return BleDevice(
      name: advName.isNotEmpty
          ? advName
          : (platformName.isNotEmpty ? platformName : '알 수 없는 장치'),
      id: remoteId,
      rssi: rssi,
    );
  }
}
