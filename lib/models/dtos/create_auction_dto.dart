
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';

part 'create_auction_dto.freezed.dart';

@freezed
class CreateAuctionDto with _$CreateAuctionDto {
  const factory CreateAuctionDto({
    required double startingPrice,
    required String endDate,
  }) = _CreateAuctionDto;
}
