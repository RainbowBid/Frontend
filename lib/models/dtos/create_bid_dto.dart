import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_bid_dto.freezed.dart';
part 'create_bid_dto.g.dart';

@freezed
class CreateBidDto with _$CreateBidDto {
  const factory CreateBidDto({
    @JsonKey(includeToJson: false) required String auctionId,
    required double value,
  }) = _CreateBidDto;

  factory CreateBidDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBidDtoFromJson(json);
}
