import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rainbowbid_frontend/models/core/file_data.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';

part 'create_item_dto.freezed.dart';

@freezed
class CreateItemDto with _$CreateItemDto {
  const factory CreateItemDto({
    required String brief,
    required String description,
    required FileData picture,
    required Category category,
  }) = _CreateItemDto;
}
