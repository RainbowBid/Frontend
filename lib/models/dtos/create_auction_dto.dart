import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rainbowbid_frontend/models/core/timestamp_converter.dart';

part 'create_auction_dto.freezed.dart';
part 'create_auction_dto.g.dart';

@freezed
class CreateAuctionDto with _$CreateAuctionDto {
  const factory CreateAuctionDto({
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'starting_price') required double startingPrice,
    @JsonKey(name: 'end_date') @TimestampConverter() required DateTime endDate,
    @JsonKey(name: 'strategy') required String strategy,
  }) = _CreateAuctionDto;

  factory CreateAuctionDto.fromJson(Map<String, dynamic> json) =>
      _$CreateAuctionDtoFromJson(json);
}
