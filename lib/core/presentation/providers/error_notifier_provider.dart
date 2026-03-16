import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_notifier_provider.g.dart';

@riverpod
class ErrorNotifier extends _$ErrorNotifier {
  @override
  String? build() => null;

  void showError(String message) {
    state = message;
  }

  void clear() {
    state = null;
  }
}
