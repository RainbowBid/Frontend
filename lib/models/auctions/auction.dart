import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rainbowbid_frontend/models/core/timestamp_converter.dart';

part 'auction.freezed.dart';
part 'auction.g.dart';

@freezed
class Auction with _$Auction {
  factory Auction({
    required String id,
    @JsonKey(name: 'starting_price') required double startingPrice,
    @JsonKey(name: 'end_date') @TimestampConverter() required DateTime endDate,
    @JsonKey(name: 'item_id') required String itemId,
  }) = _Auction;

  factory Auction.fromJson(Map<String, dynamic> json) =>
      _$AuctionFromJson(json);
}
