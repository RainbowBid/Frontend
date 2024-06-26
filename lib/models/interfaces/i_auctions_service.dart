import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/models/auctions/bid.dart';
import 'package:rainbowbid_frontend/models/dtos/auction_with_item_dto.dart';
import 'package:rainbowbid_frontend/models/dtos/create_bid_dto.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';

import '../auctions/auction.dart';
import '../dtos/create_auction_dto.dart';
import '../errors/api_error.dart';

abstract interface class IAuctionService {
  Future<Either<ApiError, Unit>> create({
    required CreateAuctionDto request,
  });

  Future<Either<ApiError, Auction>> getAuctionByItemId(String itemId);

  Future<Either<ApiError, List<AuctionWithItemDto>>> getAll(Category category);

  Future<Either<ApiError, Unit>> createBid({required CreateBidDto request});

  Future<Either<ApiError, List<Bid>>> getBidsByAuctionId(String auctionId);

  Future<Either<ApiError, Unit>> confirmAuctionFinalization(String auctionId, bool ownerResponse);
}
