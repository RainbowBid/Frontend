// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuctionImpl _$$AuctionImplFromJson(Map<String, dynamic> json) =>
    _$AuctionImpl(
      id: json['id'] as String,
      startingPrice: (json['starting_price'] as num).toDouble(),
      endDate: const TimestampConverter().fromJson(json['end_date'] as int),
      strategy: $enumDecode(_$AuctionStrategyEnumMap, json['strategy']),
      itemId: json['item_id'] as String,
    );

Map<String, dynamic> _$$AuctionImplToJson(_$AuctionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'starting_price': instance.startingPrice,
      'end_date': const TimestampConverter().toJson(instance.endDate),
      'strategy': _$AuctionStrategyEnumMap[instance.strategy]!,
      'item_id': instance.itemId,
    };

const _$AuctionStrategyEnumMap = {
  AuctionStrategy.standard: 'standard',
  AuctionStrategy.requestFinalApproval: 'requestFinalApproval',
};
