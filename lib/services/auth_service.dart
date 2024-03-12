import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';
import 'package:rainbowbid_frontend/models/auth/login_model.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auth_service.dart';
import 'package:rainbowbid_frontend/models/auth/register_model.dart';
import 'package:http/browser_client.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';

class AuthService implements IAuthService {
  final _logger = getLogger('AuthService');
  final _httpClient = BrowserClient()..withCredentials = true;

  @override
  Future<Either<ApiError, Unit>> register(RegisterModel request) async {
    try {
      _logger.i("Registering user with email: ${request.email}");

      final response = await _httpClient.post(
        Uri.http(ApiConstants.baseUrl, ApiConstants.registerUrl),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        },
        body: jsonEncode(request.toJson()),
      );

      switch (response.statusCode) {
        case HttpStatus.created:
          _logger.i("User registered successfully");
          return right(unit);
        case HttpStatus.badRequest:
        case HttpStatus.conflict:
          final error = jsonDecode(response.body).toString();
          _logger.e("Bad request occurred: $error");
          return left(ApiError.badRequest(error));
        default:
          _logger.e(
              "Server error occurred: ${response.statusCode} ${response.body}");
          return left(
            const ApiError.serverError(
              "Server error occurred. Please try again later.",
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
  Future<Either<ApiError, Unit>> login(LoginModel request) async {
    try {
      _logger.i("User logs in with email: ${request.email}");

      final response = await _httpClient.post(
        Uri.http(ApiConstants.baseUrl, ApiConstants.loginUrl),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        },
        body: jsonEncode(request.toJson()),
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          final authorizationHeader =
              response.headers[HttpHeaders.authorizationHeader];

          final jwt = authorizationHeader?.substring(7);

          if (jwt == null) {
            _logger.e("Server error occurred: JWT token is null");
            return left(
              const ApiError.serverError(
                "Server error occurred. Please try again later.",
              ),
            );
          }

          _logger.i("User logged in successfully");
          await JwtStorage.setJwt(jwt);

          return right(unit);
        case HttpStatus.unauthorized:
          final error = jsonDecode(response.body).toString();
          _logger.e("Unauthorized request occurred: $error");
          return left(ApiError.unauthorized(error));
        default:
          _logger.e(
              "Server error occurred: ${response.statusCode} ${response.body}");
          return left(
            const ApiError.serverError(
              "Server error occurred. Please try again later.",
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
