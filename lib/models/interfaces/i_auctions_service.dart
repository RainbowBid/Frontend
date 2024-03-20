import 'package:dartz/dartz.dart';

import '../dtos/create_auction_dto.dart';
import '../errors/api_error.dart';

abstract interface class IAuctionService {
  Future<Either<ApiError, Unit>> create({
    required CreateAuctionDto request,
  });
  //Future<Either<ApiError, Dto>> getAuctionById(String id);
}