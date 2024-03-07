import 'package:rainbowbid_frontend/config/api_constants.dart';
import 'package:rainbowbid_frontend/models/i_auth_service.dart';
import 'package:retrofit/http.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
class AuthService implements IAuthService {
  @override
  @POST(ApiConstants.registerUrl)
  Future<void> register();
}
