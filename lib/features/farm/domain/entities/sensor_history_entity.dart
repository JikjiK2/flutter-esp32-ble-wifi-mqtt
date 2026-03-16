import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_history_entity.freezed.dart';

@freezed
sealed class SensorHistory with _$SensorHistory {
  const factory SensorHistory({
    required DateTime timestamp,
    required double temperature,
    required double humidity,
  }) = _SensorHistory;
}

extension SensorHistoryListX on List<SensorHistory> {
  List<SensorHistory> updateWithNewPoint(
    SensorHistory newPoint,
    String period,
  ) {
    List<SensorHistory> updatedHistory = List<SensorHistory>.from(this);

    final interval = (period == "1H")
        ? const Duration(minutes: 10)
        : const Duration(hours: 1);
    final maxPoints = (period == "24H") ? 24 : 6;

    if (updatedHistory.isNotEmpty) {
      final lastPoint = updatedHistory.last;
      if (newPoint.timestamp.difference(lastPoint.timestamp) < interval) {
        updatedHistory[updatedHistory.length - 1] = newPoint;
      } else {
        updatedHistory.add(newPoint);
      }
    } else {
      updatedHistory.add(newPoint);
    }

    if (updatedHistory.length > maxPoints) {
      updatedHistory.removeAt(0);
    }

    return updatedHistory;
  }
}
