import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rainbowbid_frontend/models/core/category_converter.dart';

import '../auth/jwt_storage.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String brief,
    required String description,
    @JsonKey(name: 'user_id') required String userId,
    @CategoryConverter() required Category category,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

extension ItemX on Item {
  Future<Option<String>> getJwtForImageRequest() async {
    return (await JwtStorage.getJwt()).fold(
      () {
        return none();
      },
      (jwt) {
        return some(jwt);
      },
    );
  }
}

enum Category {
  art,
  sport,
  electronics,
  services,
  diverse,
  all;

  String get value => switch (this) {
        art => 'art',
        sport => 'sport',
        electronics => 'electronics',
        services => 'services',
        diverse => 'diverse',
        _ => '',
      };

  String get displayValue => switch (this) {
        art => 'Art',
        sport => 'Sport',
        electronics => 'Electronics',
        services => 'Services',
        diverse => 'Diverse',
        all => 'All',
      };

  static Category fromValue(String value) => switch (value) {
        'art' => art,
        'sport' => sport,
        'electronics' => electronics,
        'services' => services,
        _ => diverse,
      };
}
