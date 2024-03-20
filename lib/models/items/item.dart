import 'package:dartz/dartz.dart';

import '../../app/app.logger.dart';
import '../auth/jwt_storage.dart';
import '../errors/api_error.dart';

class Item {
  late String id;
  late String brief;
  late String description;
  late String userId;
  late Category category;

  Item({
    required this.id,
    required this.brief,
    required this.description,
    required this.userId,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brief': brief,
      'description': description,
      'user_id': userId,
      'category': category.value,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      brief: json['brief'],
      description: json['description'],
      userId: json['user_id'],
      category: Category.fromValue(json['category']),
    );
  }

  Future<Option<String>> getJwtForGetImage() async {
    getLogger("ItemDetailsViewModel")
        .i("Get jwt for GetImageUrlByItemId http call.");
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
