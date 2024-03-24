import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/models/auctions/bid.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auctions_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewBidsViewModel extends FutureViewModel<List<Bid>> {
  final String auctionId;

  ViewBidsViewModel({required this.auctionId});

  final _logger = getLogger('ViewBidsViewModel');
  final _auctionsService = locator<IAuctionService>();
  final _routerService = locator<RouterService>();

  RouterService get routerService => _routerService;

  @override
  Future<List<Bid>> futureToRun() => _getAll();

  Future<void> refresh() async {
    await initialise();
  }

  Future<List<Bid>> _getAll() async {
    final result = await _auctionsService.getBidsByAuctionId(auctionId);

    return result.fold(
      (apiError) {
        _logger.e("Bids getAll call finished with an error");
        return [];
      },
      (getAllBidsDto) {
        _logger.i("Bids getAll call finished.");
        return getAllBidsDto;
      },
    );
  }
}
