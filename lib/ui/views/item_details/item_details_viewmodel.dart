import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/services/items_service.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/auth/jwt_storage.dart';
import '../../../models/dtos/get_item_dto.dart';
import '../../../models/errors/api_error.dart';
import '../../../models/interfaces/i_items_service.dart';
import '../../../models/items/item.dart';
import '../../common/app_constants.dart';

class ItemDetailsViewModel extends FutureViewModel<Item> {
  final _logger = getLogger('ItemDetailsViewModel');
  final _sidebarController = SidebarXController(
    selectedIndex: kiSidebarCreateItemMenuIndex,
  );
  final _routerService = locator<RouterService>();
  final itemService = locator<IItemsService>();
  final String itemId;

  SidebarXController get sidebarController => _sidebarController;

  ItemDetailsViewModel({required this.itemId});

  @override
  Future<Item> futureToRun() => getItemById();

  Future<Item> getItemById() async {
      Either<ApiError, GetItemDto> result =
          await itemService.getItemById(itemId);

      return result.fold(
        (ApiError apiError) {
          _logger.e("Items getById call finished with an error");
          apiError.maybeWhen(
            unauthorized: (message) async {
              await JwtStorage.clear();
              await _routerService.replaceWithLoginView();
            },
            orElse: () {},
          );
          throw Exception(apiError.message);
        },
        (getItemDto) {
          _logger.i("Items getById call finished.");
          return getItemDto.item;
        },
      );
  }
}