import 'package:rainbowbid_frontend/services/items_service.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/interfaces/i_items_service.dart';
import '../../../models/items/item.dart';
import '../../common/app_constants.dart';

class ItemDetailsViewModel extends FutureViewModel<Item> {
  late String _currentItemId;
  late Item _currentItem;
  final _sidebarController = SidebarXController(
    selectedIndex: kiSidebarCreateItemMenuIndex,
  );
  final itemService = locator<IItemsService>();

  SidebarXController get sidebarController => _sidebarController;
  Item get currentItem => _currentItem;//not initialized ??

  set currentItemId(String id) {
    _currentItemId = id;
    rebuildUi();
  }

  @override
  Future<Item> futureToRun() => getItemById();


  Future<Item> getItemById() async {
    return await itemService.getItemById(_currentItemId);
  }

}
