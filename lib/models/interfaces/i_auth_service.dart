import 'package:rainbowbid_frontend/models/register_model.dart';
import 'package:retrofit/dio.dart';

abstract interface class IAuthService {
  Future<HttpResponse> register(RegisterModel request);
}
