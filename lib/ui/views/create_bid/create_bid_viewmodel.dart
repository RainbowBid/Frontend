import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/models/dtos/create_bid_dto.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auctions_service.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/views/create_bid/create_bid_view.form.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateBidViewModel extends FormViewModel {
  final _logger = getLogger('CreateBidViewModel');
  final _auctionService = locator<IAuctionService>();
  final _routerService = locator<RouterService>();
  final _sidebarController = SidebarXController(
    selectedIndex: kiSidebarCreateItemMenuIndex,
  );

  final String auctionId;

  CreateBidViewModel({required this.auctionId});

  Future<void> createBid() async {
    await runBusyFuture(
      _createBid(),
      busyObject: ksCreateBidKey,
    );
  }

  Future<void> _createBid() async {
    _logger.i('User creates new bid.');

    await _validate();
    _logger.i('Validation successful');

    final request = CreateBidDto(
      auctionId: auctionId,
      value: double.parse(valueValue!.replaceAll(',', '')),
    );

    final response = await _auctionService.createBid(request: request);

    response.fold(
      (error) {
        _logger.e('Error creating bid: ${error.message}');
        throw Exception(error.message);
      },
      (unit) {
        _logger.i('Bid created successfully');
      },
    );
  }

  Future<void> _validate() async {
    if (hasValueValidationMessage) {
      throw Exception(valueValidationMessage);
    }
  }
}
