import '../items/item.dart';

class GetItemDto {
  late Item item;

  GetItemDto({required this.item});

  factory GetItemDto.fromJson(Map<String, dynamic> json) {
    var item = json['items'] ;
    return GetItemDto(item: item);
  }
}
