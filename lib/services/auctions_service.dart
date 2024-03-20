import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/models/dtos/create_auction_dto.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auctions_service.dart';

class AuctionsService implements IAuctionService{
  @override
  Future<Either<ApiError, Unit>> create({required CreateAuctionDto request}) {
    // TODO: implement create
    throw UnimplementedError();
  }
}