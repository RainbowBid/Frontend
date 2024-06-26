abstract class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
  );

  static const String registerUrl = '/auth/register';
  static const String loginUrl = '/auth/login';
  static const String itemsGetAllUrl = '/items/all';
  static const String itemsCreateUrl = '/items/create';
  static const String itemsGetItemByIdUrl = '/items/:id';
  static const String itemsGetImageByItemIdUrl = '/items/:id/image';
  static const String auctionsCreateUrl = '/auctions/create';
  static const String auctionsGetByItemIdUrl = '/auctions/:itemId';
  static const String auctionsGetAllUrl = '/auctions/all';
  static const String bidsCreateUrl = '/auctions/:auctionId/bids/create';
  static const String bidsGetByAuctionIdUrl = '/auctions/:auctionId/bids/all';
  static const String confirmAuctionFinalizationUrl = '/auctions/:auctionId/confirm';

  static const String jwtStorage = "jwt.json";
  static const String jwtEncodedStorageKey = "jwt";
  static const String usernameStorageKey = "username";
  static const String userIdStorageKey = "userId";
}
