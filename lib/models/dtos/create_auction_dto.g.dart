// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_auction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateAuctionDtoImpl _$$CreateAuctionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAuctionDtoImpl(
      item_id: json['item_id'] as String,
      starting_price: (json['starting_price'] as num).toDouble(),
      end_date: DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$$CreateAuctionDtoImplToJson(
        _$CreateAuctionDtoImpl instance) =>
    <String, dynamic>{
      'item_id': instance.item_id,
      'starting_price': instance.starting_price,
      'end_date': instance.end_date.toIso8601String(),
    };
