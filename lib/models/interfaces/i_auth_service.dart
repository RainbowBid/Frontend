import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/models/auth/login_model.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/auth/register_model.dart';

abstract interface class IAuthService {
  Future<Either<ApiError, Unit>> register(RegisterModel request);
  Future<Either<ApiError, Unit>> login(LoginModel request);
}
