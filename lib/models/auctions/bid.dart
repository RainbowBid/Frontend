import 'package:freezed_annotation/freezed_annotation.dart';

part 'bid.freezed.dart';
part 'bid.g.dart';

@freezed
class Bid with _$Bid {
  factory Bid({
    required String id,
    required double value,
    @JsonKey(name: 'auction_id') required String auctionId,
    @JsonKey(name: 'user_id') required String userId,
    required String username,
  }) = _Bid;

  factory Bid.fromJson(Map<String, dynamic> json) => _$BidFromJson(json);
}
