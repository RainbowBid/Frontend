
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_auction_dto.freezed.dart';
part 'create_auction_dto.g.dart';

@freezed
class CreateAuctionDto with _$CreateAuctionDto {
  const factory CreateAuctionDto({
    required String item_id,
    required double starting_price,
    required DateTime end_date,
  }) = _CreateAuctionDto;

  factory CreateAuctionDto.fromJson(Map<String, dynamic> json) =>
      _$CreateAuctionDtoFromJson(json);
}