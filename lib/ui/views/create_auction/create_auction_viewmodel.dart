import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/auctions/auction.dart';
import 'package:rainbowbid_frontend/models/validators/auction_validator.dart';
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
  AuctionStrategy _selectedStrategy = AuctionStrategy.standard;

  late Option<DateTime> _endDate = none();

  RouterService get routerService => _routerService;
  SidebarXController get sidebarController => _sidebarController;
  Option<DateTime> get endDate => _endDate;
  AuctionStrategy get selectedStrategy => _selectedStrategy;

  set endDate(Option<DateTime> value) {
    _endDate = value;
    rebuildUi();
  }

  set selectedStrategy(AuctionStrategy value) {
    _selectedStrategy = value;
    rebuildUi();
  }

  bool get hasEndDateValidationMessage => endDateValidationMessage != null;

  String? get endDateValidationMessage =>
      AuctionValidator.validateEndDate(endDate);

  CreateAuctionViewModel({required this.itemId});

  Future<void> createAuction() async {
    await runBusyFuture(
      _createAuction(),
      busyObject: ksCreateAuctionKey,
    );
  }

  Future<void> _createAuction() async {
    _logger.i('User creates new auction.');

    await _validate();
    _logger.i('Validation successful');

    final request = CreateAuctionDto(
      itemId: itemId,
      startingPrice: double.parse(startingPriceValue!.replaceAll(',', '')),
      endDate: endDate.getOrElse(() => DateTime.now()),
    );

    final response = await _auctionService.create(request: request);

    await response.fold(
      (ApiError error) {
        _logger.e('Error occurred: ${error.message}');
        throw Exception(error.message);
      },
      (unit) async {
        await _routerService.replaceWithItemDetailsView(id: itemId);
      },
    );
  }

  Future<void> _validate() async {
    if (hasStartingPriceValidationMessage) {
      throw Exception(startingPriceValidationMessage);
    }

    final endDateValidationMessage = AuctionValidator.validateEndDate(endDate);
    if (endDateValidationMessage != null) {
      throw Exception(endDateValidationMessage);
    }
  }
}
