import '../items/item.dart';

class GetAllItemsDto {
  late List<Item> items;

  GetAllItemsDto({required this.items});

  factory GetAllItemsDto.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<Item> items = itemsList.map((item) => Item.fromJson(item)).toList();
    return GetAllItemsDto(items: items);
  }
}