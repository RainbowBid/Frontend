import '../items/item.dart';

class GetItemDto {
  late Item item;

  GetItemDto({required this.item});

  factory GetItemDto.fromJson(Map<String, dynamic> json) {
    var item = Item.fromJson(json);
    return GetItemDto(item: item);
  }
}
