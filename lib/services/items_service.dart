import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';
import 'package:rainbowbid_frontend/models/dtos/create_item_dto.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';


import 'package:rainbowbid_frontend/models/dtos/get_all_items_dto.dart';

import 'package:rainbowbid_frontend/models/errors/api_error.dart';

import '../app/app.logger.dart';
import '../models/interfaces/i_items_service.dart';

class ItemsService implements IItemsService {
  final _logger = getLogger('ItemsService');
  final _httpClient = BrowserClient()..withCredentials = true;

  @override
  Future<Either<ApiError, GetAllItemsDto>> getAll() async {
    try {
      _logger.i("Get all items for user.");
      final String jwt = (await JwtStorage.getJwt()).fold(() {
        return "";
      }, (jwt) {
        return jwt;
      });
      if (jwt.isEmpty) {
        return left(
          const ApiError.unauthorized(
            "Get all was unauthorized. Jwt = {}",
          ),
        );
      }
      Map<String, String> heads = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: "Bearer ${jwt}",
      };
      final response = await _httpClient.get(
        Uri.http(ApiConstants.baseUrl, ApiConstants.itemsGetAllUrl),
        headers: heads,

      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          _logger.i("Get all was successfully completed");

          return right(GetAllItemsDto.fromJson(json.decode(response.body)));
        case HttpStatus.unauthorized:
          _logger.i("Get all was unauthorized");
          return left(
            const ApiError.unauthorized(
              "Get all was unauthorized.",
            ),
          );

        default:
          _logger.e(
              "Server error occurred: ${response.statusCode} ${response.body}");
          return left(
            const ApiError.serverError(
              "Server error occurred. Please try again later.",
            ),
          );
      }
    }catch (e) {

      _logger.e("Server error occurred: $e");
      return left(
        const ApiError.serverError(
          "Server error occurred. Please try again later.",
        ),
      );
    }
  }

  @override
  Future<Either<ApiError, Unit>> create({
    required CreateItemDto request,
  }) async {
    try {
      _logger.i("Creating item with brief: ${request.brief}");

      final accessToken = await JwtStorage.getJwt();
      if (accessToken.isNone()) {
        _logger.e("User is not authenticated");
        return left(
          const ApiError.unauthorized(
            "User is not authenticated",
          ),
        );
      }

      final streamedResponse = await _httpClient.send(
        MultipartRequest(
          "POST",
          Uri.http(
            ApiConstants.baseUrl,
            ApiConstants.itemsCreateUrl,
          ),
        )
          ..headers[HttpHeaders.authorizationHeader] =
              "Bearer ${accessToken.getOrElse(() => "")}"
          ..fields['brief'] = request.brief
          ..fields['description'] = request.description
          ..fields['category'] = request.category.value
          ..files.add(
            MultipartFile.fromBytes(
              'picture',
              request.picture.bytes,
              contentType: MediaType.parse(request.picture.mimeType),
              filename: request.picture.filename,
            ),
          ),
      );

      final response = await Response.fromStream(streamedResponse);

      switch (response.statusCode) {
        case HttpStatus.created:
          _logger.i("Item was successfully created");
          return right(unit);
        default:
          _logger.e(
              "Server error occurred: ${response.statusCode} ${response.body}");
          return left(
            ApiError.serverError(
              "Server error occurred: ${response.body}",
            ),
          );
      }
    } catch (e) {
      _logger.e("Server error occurred: $e");
      return left(
        const ApiError.serverError(
          "Server error occurred. Please try again later.",
        ),
      );
    }
  }
}

