import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/auctions/auction.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auctions_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuctionDetailsViewModel extends FutureViewModel<Option<Auction>> {
  final _logger = getLogger('AuctionDetailsViewModel');

  final _routerService = locator<RouterService>();
  final _auctionService = locator<IAuctionService>();

  RouterService get routerService => _routerService;

  final String itemId;

  AuctionDetailsViewModel({required this.itemId});

  @override
  Future<Option<Auction>> futureToRun() => _getAuctionByItemId(itemId);

  Future<Option<Auction>> _getAuctionByItemId(String itemId) async {
    Either<ApiError, Auction> result =
        await _auctionService.getAuctionByItemId(itemId);

    return result.fold(
      (ApiError apiError) {
        _logger.e(
            "Auction getAuctionByItemId call finished with an error: ${apiError.message}");
        return apiError.maybeWhen(
          notFound: (message) {
            return none();
          },
          orElse: () {
            throw Exception(apiError.message);
          },
        );
      },
      (auction) {
        _logger.i("Auction getAuctionByItemId call finished.");
        return some(auction);
      },
    );
  }

  Future<void> confirmAuctionFinalization(String auctionId, bool ownerResponse) async {
    Either<ApiError, Unit> result = await _auctionService.confirmAuctionFinalization(auctionId, ownerResponse);

    result.fold(
      (ApiError apiError) {
        _logger.e(
            "Auction confirmAuctionFinalization call finished with an error: ${apiError.message}");
        throw Exception(apiError.message);
      },
      (_) {

        _logger.i("Auction confirmAuctionFinalization call finished.");
        _routerService.replaceWithHomeView();
      },
    );
  }
}
