import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';

class JsonWrapper {
  final String value;

  JsonWrapper({required this.value});

  Map<String, dynamic> toJson() => {"key": value};
}

class JwtStorage {
  static final _jwtStorage = LocalStorage(ApiConstants.jwtStorage);

  static Future<void> clear() async {
    await _jwtStorage.clear();
  }

  static Future<void> init() async {
    await _jwtStorage.ready;
  }

  static Future<bool> hasCurrentUser() async {
    final token = await getJwt();
    return token.isSome();
  }

  static Future<void> setJwt(String rawJwt) async {
    await _jwtStorage.setItem(
      ApiConstants.jwtEncodedStorageKey,
      JsonWrapper(value: rawJwt),
    );

    final jwt = JwtDecoder.decode(rawJwt);

    setUsername(jwt['username']);
    setUserId(jwt['sub']);
  }

  static Future<Option<String>> getJwt() async {
    final data = await _jwtStorage.getItem(ApiConstants.jwtEncodedStorageKey);

    if (data == null) {
      return none();
    }

    return some(data['key'] as String);
  }

  static Future<void> setUsername(String username) async {
    await _jwtStorage.setItem(
      ApiConstants.usernameStorageKey,
      JsonWrapper(value: username),
    );
  }

  static Future<Option<String>> getUserUsername() async {
    return switch (_jwtStorage.getItem(ApiConstants.usernameStorageKey)) {
      final JsonWrapper username => some(username.value),
      _ => none(),
    };
  }

  static Future<void> setUserId(String id) async {
    await _jwtStorage.setItem(
        ApiConstants.userIdStorageKey, JsonWrapper(value: id));
  }

  static Future<Option<String>> getUserId() async {
    return switch (_jwtStorage.getItem(ApiConstants.userIdStorageKey)) {
      final JsonWrapper id => some(id.value),
      _ => none(),
    };
  }
}
