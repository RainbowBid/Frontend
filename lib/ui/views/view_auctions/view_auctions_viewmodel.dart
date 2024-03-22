import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/models/dtos/auction_with_item_dto.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auctions_service.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewAuctionsViewModel extends FutureViewModel<List<AuctionWithItemDto>> {
  final _logger = getLogger('ViewAuctionsViewModel');
  final _auctionsService = locator<IAuctionService>();
  final _routerService = locator<RouterService>();
  late Category _selectedCategory = Category.all;

  RouterService get routerService => _routerService;
  Category get selectedCategory => _selectedCategory;

  set selectedCategory(Category value) {
    _selectedCategory = value;
    rebuildUi();
  }

  Future<void> refresh() async {
    await initialise();
  }

  Future<List<AuctionWithItemDto>> _getAll() async {
    final result = await _auctionsService.getAll(_selectedCategory);

    return result.fold(
      (apiError) {
        _logger.e("Auctions getAll call finished with an error");
        return [];
      },
      (getAllAuctionsDto) {
        _logger.i("Auctions getAll call finished.");
        return getAllAuctionsDto;
      },
    );
  }

  @override
  Future<List<AuctionWithItemDto>> futureToRun() => _getAll();
}
