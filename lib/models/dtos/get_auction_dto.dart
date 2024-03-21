import '../auctions/auction.dart';
import '../items/item.dart';

class GetAuctionDto {
  late Auction auction;

  GetAuctionDto({required this.auction});

  factory GetAuctionDto.fromJson(Map<String, dynamic> json) {
    var auction = Auction.fromJson(json);
    return GetAuctionDto(auction: auction);
  }
}
