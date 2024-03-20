import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/ui/views/create_auction/create_auction_view.form.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/dtos/create_auction_dto.dart';
import '../../../models/errors/api_error.dart';
import '../../../models/interfaces/i_auctions_service.dart';
import '../../common/app_constants.dart';

class CreateAuctionViewModel extends FormViewModel {
  final _logger = getLogger('CreateAuctionViewModel');
  final _auctionService = locator<IAuctionService>();
  final _routerService = locator<RouterService>();
  final _sidebarController = SidebarXController(
    selectedIndex: kiSidebarCreateItemMenuIndex,
  );
  final String itemId;

  RouterService get routerService => _routerService;
  SidebarXController get sidebarController => _sidebarController;

  CreateAuctionViewModel({required this.itemId});

  Future<void> createAuction() async {
    await runBusyFuture(
      _createAuction(),
      busyObject: ksCreateItemKey,
    );
  }

  Future<void> _createAuction() async {
    _logger.i('User creates new auction.');

    await _validate();
    _logger.i('Validation successful');

    final request = CreateAuctionDto(
      //todo remove 'as'
      startingPrice: startingPriceValue! as double,
      endDate: endDateValue! as DateTime,
    );

    final response = await _auctionService.create(request: request);

    await response.fold(
          (ApiError error) {
        _logger.e('Error occurred: ${error.message}');
        throw Exception(error.message);
      },
          (unit) async {
        await _routerService.replaceWithHomeView();
      },
    );
  }

  Future<void> _validate() async {
    if (hasStartingPriceValidationMessage) {
      throw Exception(startingPriceValidationMessage);
    }

    if (hasEndDateValidationMessage) {
      throw Exception(endDateValidationMessage);
    }
  }
}
