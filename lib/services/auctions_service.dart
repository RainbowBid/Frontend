import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/browser_client.dart';
import 'package:rainbowbid_frontend/models/auctions/auction.dart';
import 'package:rainbowbid_frontend/models/auctions/bid.dart';
import 'package:rainbowbid_frontend/models/dtos/auction_with_item_dto.dart';
import 'package:rainbowbid_frontend/models/dtos/create_auction_dto.dart';
import 'package:rainbowbid_frontend/models/dtos/create_bid_dto.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auctions_service.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';

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

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
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

  @override
  Future<Either<ApiError, List<AuctionWithItemDto>>> getAll(
      Category category) async {
    try {
      _logger.i("Getting all auctions for category: $category");

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      };

      final queryParams = <String, dynamic>{};
      if (category != Category.all) {
        queryParams["category"] = category.value;
      }

      final response = await _httpClient.get(
        Uri.http(
          ApiConstants.baseUrl,
          ApiConstants.auctionsGetAllUrl,
          queryParams,
        ),
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = jsonDecode(response.body);
        final List<AuctionWithItemDto> auctions = (jsonBody["auctions"] as List)
            .map((auction) => AuctionWithItemDto.fromJson(auction))
            .toList();
        _logger.i("Auctions retrieved successfully: $auctions");
        return right(auctions);
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

  @override
  Future<Either<ApiError, Unit>> createBid({
    required CreateBidDto request,
  }) async {
    try {
      _logger.i("Creating bid for auction with id: ${request.auctionId}");

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
          ApiConstants.bidsCreateUrl.replaceFirst(
            ':auctionId',
            request.auctionId,
          ),
        ),
        headers: heads,
        body: jsonEncode(request.toJson()),
      );

      switch (response.statusCode) {
        case HttpStatus.created:
          _logger.i("Bid was successfully created");
          return right(unit);
        case HttpStatus.unauthorized:
          _logger.e("User is not authenticated");
          return left(
            const ApiError.unauthorized(
              "User is not authenticated",
            ),
          );
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
  Future<Either<ApiError, List<Bid>>> getBidsByAuctionId(
      String auctionId) async {
    try {
      _logger.i("Getting bids for auction with id: $auctionId");

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
          ApiConstants.bidsGetByAuctionIdUrl
              .replaceFirst(":auctionId", auctionId),
        ),
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = jsonDecode(response.body);
        final List<Bid> bids =
            (jsonBody["bids"] as List).map((bid) => Bid.fromJson(bid)).toList()
              ..sort(
                (a, b) => b.value.compareTo(a.value),
              );
        _logger.i("Bids retrieved successfully: $bids");
        return right(bids);
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
