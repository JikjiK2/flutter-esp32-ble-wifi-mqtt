import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth_local_datasource.g.dart';

@riverpod
class AuthLocalDataSource extends _$AuthLocalDataSource {
  static const _tokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';

  final _storage = const FlutterSecureStorage();

  @override
  FutureOr<void> build() async {}

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> removeToken() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
