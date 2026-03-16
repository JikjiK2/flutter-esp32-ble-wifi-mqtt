import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_entity.freezed.dart';

@freezed
abstract class DeviceEntity with _$DeviceEntity {
  const factory DeviceEntity({
    required String deviceId,
    required String name,
  }) = _DeviceEntity;
}