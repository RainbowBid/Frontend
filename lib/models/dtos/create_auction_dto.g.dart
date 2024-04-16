// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_auction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateAuctionDtoImpl _$$CreateAuctionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAuctionDtoImpl(
      itemId: json['item_id'] as String,
      startingPrice: (json['starting_price'] as num).toDouble(),
      endDate: const TimestampConverter().fromJson(json['end_date'] as int),
      strategy: json['strategy'] as String,
    );

Map<String, dynamic> _$$CreateAuctionDtoImplToJson(
        _$CreateAuctionDtoImpl instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'starting_price': instance.startingPrice,
      'end_date': const TimestampConverter().toJson(instance.endDate),
      'strategy': instance.strategy,
    };
