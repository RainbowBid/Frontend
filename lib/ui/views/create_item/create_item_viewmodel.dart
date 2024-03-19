import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/core/file_data.dart';
import 'package:rainbowbid_frontend/models/dtos/create_item_dto.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_items_service.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/views/create_item/create_item_view.form.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateItemViewModel extends FormViewModel {
  final _logger = getLogger('CreateItemViewModel');
  final _itemsService = locator<IItemsService>();
  final _routerService = locator<RouterService>();
  final _sidebarController = SidebarXController(
    selectedIndex: kiSidebarCreateItemMenuIndex,
  );

  late Category _selectedCategory = Category.diverse;
  late Option<FileData> _selectedPicture = none();

  Category get selectedCategory => _selectedCategory;

  Option<FileData> get selectedPicture => _selectedPicture;

  set selectedCategory(Category value) {
    _selectedCategory = value;
    rebuildUi();
  }

  set selectedPicture(Option<FileData> value) {
    _selectedPicture = value;
    rebuildUi();
  }

  RouterService get routerService => _routerService;

  SidebarXController get sidebarController => _sidebarController;

  Future<void> updatePicture() async {
    await runBusyFuture(
      _updatePicture(),
      busyObject: ksCreateItemKey,
    );
  }

  Future<void> _updatePicture() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result == null) return;

    final file = result.files.single;
    final bytes = file.bytes;
    final filename = file.name;
    final mimeType = file.extension;

    if (bytes == null || mimeType == null) return;

    selectedPicture = some((
      bytes: bytes,
      filename: filename,
      mimeType: 'image/$mimeType',
    ));
  }

  Future<void> createItem() async {
    await runBusyFuture(
      _createItem(),
      busyObject: ksCreateItemKey,
    );
  }

  Future<void> _createItem() async {
    _logger.i('User creates new item.');
    await _validate();

    _logger.i('Validation successful');
    final request = CreateItemDto(
      brief: briefValue!,
      description: descriptionValue!,
      picture: selectedPicture.getOrElse(() => throw Exception('No picture')),
      category: selectedCategory,
    );

    final response = await _itemsService.create(request: request);

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
    if (hasBriefValidationMessage) {
      throw Exception(briefValidationMessage);
    }

    if (hasDescriptionValidationMessage) {
      throw Exception(descriptionValidationMessage);
    }

    if (selectedPicture.isNone()) {
      throw Exception('Please select a picture');
    }
  }
}
