import 'package:json_annotation/json_annotation.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';

class CategoryConverter implements JsonConverter<Category, String> {
  const CategoryConverter();

  @override
  Category fromJson(String json) {
    return Category.fromValue(json);
  }

  @override
  String toJson(Category object) {
    return object.value;
  }
}
