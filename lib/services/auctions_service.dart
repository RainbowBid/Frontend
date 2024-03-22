import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/browser_client.dart';
import 'package:rainbowbid_frontend/models/auctions/auction.dart';
import 'package:rainbowbid_frontend/models/dtos/create_auction_dto.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auctions_service.dart';

import '../app/app.logger.dart';
import '../config/api_constants.dart';
import '../models/auth/jwt_storage.dart';

class AuctionsService implements IAuctionService {
  final _logger = getLogger('AuctionsService');
  final _httpClient = BrowserClient()..withCredentials = true;

  @override
  Future<Either<ApiError, Unit>> create({
    required CreateAuctionDto request,
  }) async {
    try {
      _logger.i("Creating auction for item with id: ${request.itemId}");

      final accessToken = await JwtStorage.getJwt();
      if (accessToken.isNone()) {
        _logger.e("User is not authenticated");
        return left(
          const ApiError.unauthorized(
            "User is not authenticated",
          ),
        );
      }

      Map<String, String> heads = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader:
            "Bearer ${accessToken.getOrElse(() => "")}",
      };

      _logger.i(request.toJson());
      final response = await _httpClient.post(
        Uri.http(
          ApiConstants.baseUrl,
          ApiConstants.auctionsCreateUrl,
        ),
        headers: heads,
        body: jsonEncode(request.toJson()),
      );

      switch (response.statusCode) {
        case HttpStatus.created:
          _logger.i("Auction was successfully created");
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

  @override
  Future<Either<ApiError, Auction>> getAuctionByItemId(String itemId) async {
    try {
      _logger.i("Getting auction for item with id: $itemId");

      final accessToken = await JwtStorage.getJwt();
      if (accessToken.isNone()) {
        _logger.e("User is not authenticated");
        return left(
          const ApiError.unauthorized(
            "User is not authenticated",
          ),
        );
      }

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader:
            "Bearer ${accessToken.getOrElse(() => "")}",
      };

      final response = await _httpClient.get(
        Uri.http(
          ApiConstants.baseUrl,
          ApiConstants.auctionsGetByItemIdUrl.replaceFirst(":itemId", itemId),
        ),
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = jsonDecode(response.body);
        final auction = Auction.fromJson(jsonBody);
        _logger.i("Auction retrieved successfully: $auction");
        return right(auction);
      } else if (response.statusCode == HttpStatus.notFound) {
        _logger.e("Auction not found");
        return left(
          const ApiError.notFound(
            "Auction not found",
          ),
        );
      } else if (response.statusCode == HttpStatus.unauthorized) {
        _logger.e("User is not authenticated");
        return left(
          const ApiError.unauthorized(
            "User is not authenticated",
          ),
        );
      } else {
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
