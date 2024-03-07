import 'package:dio/dio.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';
import 'package:rainbowbid_frontend/models/i_auth_service.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthService implements IAuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  static IAuthService getAuthServiceInstance() {
    final dio = Dio();
    return AuthService(dio);
  }

  @override
  @POST(ApiConstants.registerUrl)
  Future<void> register();
}
