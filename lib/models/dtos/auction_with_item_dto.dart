import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rainbowbid_frontend/models/core/category_converter.dart';
import 'package:rainbowbid_frontend/models/core/strategy_converter.dart';
import 'package:rainbowbid_frontend/models/core/timestamp_converter.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';

part 'auction_with_item_dto.freezed.dart';
part 'auction_with_item_dto.g.dart';

@freezed
class AuctionWithItemDto with _$AuctionWithItemDto {
  const factory AuctionWithItemDto({
    required String id,
    @JsonKey(name: 'starting_price') required double startingPrice,
    @JsonKey(name: 'end_date') @TimestampConverter() required DateTime endDate,
    @JsonKey(name: 'item_id') required String itemId,
    required String brief,
    required String description,
    @CategoryConverter() required Category category,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'strategy') @StrategyConverter() required String strategy,
  }) = _AuctionWithItemDto;

  factory AuctionWithItemDto.fromJson(Map<String, dynamic> json) =>
      _$AuctionWithItemDtoFromJson(json);
}
