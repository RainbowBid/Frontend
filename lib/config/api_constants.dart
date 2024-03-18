abstract class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
  );

  static const String registerUrl = '/auth/register';
  static const String loginUrl = '/auth/login';
  static const String itemsGetAllUrl = '/items/all';

  static const String jwtStorage = "jwt.json";
  static const String jwtEncodedStorageKey = "jwt";
  static const String usernameStorageKey = "username";
  static const String userIdStorageKey = "userId";
}
