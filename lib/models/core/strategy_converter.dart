import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rainbowbid_frontend/models/auctions/auction.dart';

class StrategyConverter implements JsonConverter<AuctionStrategy, String> {
  const StrategyConverter();

  @override
  AuctionStrategy fromJson(String json) {
    return AuctionStrategy.fromString(json);
  }

  @override
  String toJson(AuctionStrategy object) {
    return object.toString();
  }
}
