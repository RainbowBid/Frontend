import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/models/dtos/create_item_dto.dart';

import '../dtos/get_all_items_dto.dart';
import '../errors/api_error.dart';
import '../items/item.dart';

abstract interface class IItemsService {
  Future<Either<ApiError, GetAllItemsDto>> getAll(Category category);
  Future<Either<ApiError, Unit>> create({
    required CreateItemDto request,
  });
}

