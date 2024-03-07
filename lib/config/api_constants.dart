abstract class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
  );

  static const String registerUrl = '/auth/register';
}
