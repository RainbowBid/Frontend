import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rainbowbid_frontend/models/core/timestamp_converter.dart';

import '../../ui/common/app_constants.dart';

part 'auction.freezed.dart';
part 'auction.g.dart';

@freezed
class Auction with _$Auction {
  factory Auction({
    required String id,
    @JsonKey(name: 'starting_price') required double startingPrice,
    @JsonKey(name: 'end_date') @TimestampConverter() required DateTime endDate,
    @JsonKey(name: 'strategy') required AuctionStrategy strategy,
    @JsonKey(name: 'item_id') required String itemId,
  }) = _Auction;

  factory Auction.fromJson(Map<String, dynamic> json) =>
      _$AuctionFromJson(json);
}

enum AuctionStrategy {
  standard,
  requestFinalApproval;

  static AuctionStrategy fromString(String value) {
    switch (value) {
      case ksStandardStrategyEnum:
        return AuctionStrategy.standard;
      case ksRequestFinalApprovalStrategyEnum:
        return AuctionStrategy.requestFinalApproval;
      default:
        throw ArgumentError('Unknown AuctionStrategy string: $value');
    }
  }

  String _getString() {
    switch (this) {
      case AuctionStrategy.standard:
        return ksStandardStrategyEnum;
      case AuctionStrategy.requestFinalApproval:
        return ksRequestFinalApprovalStrategyEnum;
      default:
        throw Exception('Unknown AuctionStrategy');
    }
  }

  @override
  String toString() {
    return _getString();
  }
}


