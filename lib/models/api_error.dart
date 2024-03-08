import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
sealed class ApiError with _$ApiError {
  const factory ApiError.serverError(String message) = ServerError;

  const factory ApiError.unauthorized(String message) = Unauthorized;

  const factory ApiError.notFound(String message) = NotFound;

  const factory ApiError.badRequest(String message) = BadRequest;
}
