import 'package:dartz/dartz.dart';

import '../dtos/get_all_items_dto.dart';
import '../errors/api_error.dart';

abstract interface class IItemsService{
  Future<Either<ApiError,GetAllItemsDto>> getAll();
}