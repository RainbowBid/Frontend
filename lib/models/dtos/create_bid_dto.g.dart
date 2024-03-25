// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_bid_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateBidDtoImpl _$$CreateBidDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateBidDtoImpl(
      auctionId: json['auctionId'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$CreateBidDtoImplToJson(_$CreateBidDtoImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
