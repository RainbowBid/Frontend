import 'package:dartz/dartz.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';

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

  SidebarXController get sidebarController => _sidebarController;

  Future<List<Item>> getAll() async {
    Either<ApiError, GetAllItemsDto> result = await _itemsService.getAll();

    return result.fold(
      (apiError) {
        _logger.e("Items getAll call finished with an error");
        return [];
      },
      (getAllItemsDto) {
        _logger.i("Items getAll call finished.");
        // Transform GetAllItemsDto into a list of items
        List<Item> items = getAllItemsDto.items.map(
          (itemDto) {
            // Convert each itemDto into an Item object
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
