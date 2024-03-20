
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_auction_dto.freezed.dart';

@freezed
class CreateAuctionDto with _$CreateAuctionDto {
  const factory CreateAuctionDto({
    required double startingPrice,
    required DateTime endDate,
  }) = _CreateAuctionDto;
}