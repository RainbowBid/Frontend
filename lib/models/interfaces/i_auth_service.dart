import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/models/api_error.dart';
import 'package:rainbowbid_frontend/models/register_model.dart';

abstract interface class IAuthService {
  Future<Either<ApiError, Unit>> register(RegisterModel request);
}
