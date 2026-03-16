import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/device_entity.dart';

part 'device_model.freezed.dart';

part 'device_model.g.dart';

@freezed
sealed class DeviceModel with _$DeviceModel {
  const DeviceModel._();

  const factory DeviceModel({
    @JsonKey(name: 'device_id') required String deviceId,
    required String name,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  DeviceEntity toEntity() {
    return DeviceEntity(deviceId: deviceId, name: name);
  }
}
