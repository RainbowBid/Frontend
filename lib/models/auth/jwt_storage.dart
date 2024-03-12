import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';

class JwtStorage {
  static final _jwtStorage = LocalStorage(ApiConstants.jwtStorage);

  static Future<void> setJwt(String jwt) async {
    await _jwtStorage.setItem(ApiConstants.jwtStorageKey, jwt);
  }

  static Future<Option<String>> getJwt() async {
    return switch (_jwtStorage.getItem(ApiConstants.jwtStorageKey)) {
      final String jwt => some(jwt),
      _ => none(),
    };
  }
}
