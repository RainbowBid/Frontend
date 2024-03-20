import 'package:dartz/dartz.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/dtos/get_all_items_dto.dart';
import '../../../models/errors/api_error.dart';
import '../../../models/interfaces/i_items_service.dart';
import '../../../models/items/item.dart';
import '../../common/app_constants.dart';

class ViewItemsViewModel extends FutureViewModel<List<Item>> {
  final _logger = getLogger('ViewItemsViewModel');
  final _sidebarController = SidebarXController(
    selectedIndex: kiSidebarViewItemsMenuIndex,
  );
  final _itemsService = locator<IItemsService>();
  final _routerService = locator<RouterService>();

  SidebarXController get sidebarController => _sidebarController;
  RouterService get routerService => _routerService;

  Future<List<Item>> getAll() async {
    Either<ApiError, GetAllItemsDto> result = await _itemsService.getAll();

    return result.fold(
      (ApiError apiError) {
        _logger.e("Items getAll call finished with an error");
        apiError.maybeWhen(
          unauthorized: (message) async {
            await JwtStorage.clear();
            await _routerService.replaceWithLoginView();
          },
          orElse: () {},
        );

        return [];
      },
      (getAllItemsDto) {
        _logger.i("Items getAll call finished.");
        List<Item> items = getAllItemsDto.items.map(
          (itemDto) {
            return Item(
              brief: itemDto.brief,
              description: itemDto.description,
              id: itemDto.id,
              picture: itemDto.picture,
              userId: itemDto.userId,
            );
          },
        ).toList();

        return items;
      },
    );
  }

  @override
  Future<List<Item>> futureToRun() => getAll();
}
