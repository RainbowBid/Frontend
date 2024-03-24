// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BidImpl _$$BidImplFromJson(Map<String, dynamic> json) => _$BidImpl(
      id: json['id'] as String,
      value: (json['value'] as num).toDouble(),
      auctionId: json['auction_id'] as String,
      userId: json['user_id'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$BidImplToJson(_$BidImpl instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'auction_id': instance.auctionId,
      'user_id': instance.userId,
      'username': instance.username,
    };
