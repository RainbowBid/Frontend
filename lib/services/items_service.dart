import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/browser_client.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';

import 'package:rainbowbid_frontend/models/dtos/get_all_items_dto.dart';

import 'package:rainbowbid_frontend/models/errors/api_error.dart';

import '../app/app.logger.dart';
import '../models/interfaces/i_items_service.dart';

class ItemsService implements IItemsService{
  final _logger = getLogger('ItemsService');
  final _httpClient = BrowserClient()..withCredentials = true;


  @override
  Future<Either<ApiError, GetAllItemsDto>> getAll() async {
    _logger.i("Get all items for user.");

    final response = await _httpClient.get(
      Uri.http(ApiConstants.baseUrl, ApiConstants.itemsGetAllUrl),
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        _logger.i("Get all was successfully completed");
        return right(response);
      case HttpStatus.unauthorized:
      default:
        _logger.e(
            "Server error occurred: ${response.statusCode} ${response.body}");
        return left(
          const ApiError.serverError(
            "Server error occurred. Please try again later.",
          ),
        );
    }
  }
}