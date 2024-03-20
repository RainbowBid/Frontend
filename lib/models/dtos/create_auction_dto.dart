import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_auction_dto.freezed.dart';
part 'create_auction_dto.g.dart';

@freezed
class CreateAuctionDto with _$CreateAuctionDto {
  const factory CreateAuctionDto({
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'starting_price') required double startingPrice,
    @JsonKey(name: 'end_date') @TimestampConverter() required DateTime endDate,
  }) = _CreateAuctionDto;

  factory CreateAuctionDto.fromJson(Map<String, dynamic> json) =>
      _$CreateAuctionDtoFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime, int> {
  const TimestampConverter();

  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json);
  }

  @override
  int toJson(DateTime object) {
    return object.millisecondsSinceEpoch;
  }
}
