// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction_with_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuctionWithItemDtoImpl _$$AuctionWithItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AuctionWithItemDtoImpl(
      id: json['id'] as String,
      startingPrice: (json['starting_price'] as num).toDouble(),
      endDate: const TimestampConverter().fromJson(json['end_date'] as int),
      itemId: json['item_id'] as String,
      brief: json['brief'] as String,
      description: json['description'] as String,
      category: const CategoryConverter().fromJson(json['category'] as String),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$$AuctionWithItemDtoImplToJson(
        _$AuctionWithItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'starting_price': instance.startingPrice,
      'end_date': const TimestampConverter().toJson(instance.endDate),
      'item_id': instance.itemId,
      'brief': instance.brief,
      'description': instance.description,
      'category': const CategoryConverter().toJson(instance.category),
      'user_id': instance.userId,
    };
