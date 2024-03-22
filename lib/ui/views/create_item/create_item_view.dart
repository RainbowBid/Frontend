import 'package:dartz/dartz.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';
import 'package:rainbowbid_frontend/models/validators/item_validator.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/create_item/create_item_view.form.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:rainbowbid_frontend/ui/views/create_item/create_item_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'brief',
    validator: ItemValidator.validateBrief,
  ),
  FormTextField(
    name: 'description',
    validator: ItemValidator.validateDescription,
  ),
])
class CreateItemView extends StackedView<CreateItemViewModel>
    with $CreateItemView {
  const CreateItemView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateItemViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppSidebar(
            controller: viewModel.sidebarController,
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(kdPagePadding),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildCreateItemPageTitle(context),
                        verticalSpaceLarge,
                        _buildPicturePicker(context, viewModel),
                        verticalSpaceLarge,
                        _buildCategoryField(context, viewModel),
                        verticalSpaceLarge,
                        _buildBriefField(context, viewModel),
                        verticalSpaceLarge,
                        _buildDescriptionField(context, viewModel),
                        verticalSpaceMedium,
                        _buildCreateItemButton(context, viewModel),
                        verticalSpaceMedium,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateItemPageTitle(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Create item',
          style: TextStyle(
            fontSize: kdTitleSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpaceSmall,
        Text(
          'Add a new item to your inventory before you can start auctions for it',
          style: TextStyle(
            fontSize: kdSubtitleSize,
          ),
        ),
      ],
    );
  }

  Widget _buildBriefField(
    BuildContext context,
    CreateItemViewModel viewModel,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: briefController,
          focusNode: briefFocusNode,
          keyboardType: TextInputType.multiline,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: kiMaxItemBriefLength,
          maxLines: null,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            focusedBorder: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kcLightGrey),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kdFieldBorderRadius,
                ),
              ),
            ),
            label: RichText(
              text: const TextSpan(
                text: 'Brief',
                style: TextStyle(
                  fontSize: kdFieldLabelFontSize,
                  color: kcMediumGrey,
                ),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: kcRed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (viewModel.hasBriefValidationMessage) ...[
          verticalSpaceTiny,
          Text(
            viewModel.briefValidationMessage!,
            style: const TextStyle(
              color: kcRed,
              fontSize: kdFieldValidationFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ]
      ],
    );
  }

  Widget _buildDescriptionField(
    BuildContext context,
    CreateItemViewModel viewModel,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: descriptionController,
          focusNode: descriptionFocusNode,
          keyboardType: TextInputType.multiline,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: kiMaxItemDescriptionLength,
          maxLines: null,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            focusedBorder: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kcLightGrey),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kdFieldBorderRadius,
                ),
              ),
            ),
            label: RichText(
              text: const TextSpan(
                text: 'Description',
                style: TextStyle(
                  fontSize: kdFieldLabelFontSize,
                  color: kcMediumGrey,
                ),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: kcRed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (viewModel.hasDescriptionValidationMessage) ...[
          verticalSpaceTiny,
          Text(
            viewModel.descriptionValidationMessage!,
            style: const TextStyle(
              color: kcRed,
              fontSize: kdFieldValidationFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ]
      ],
    );
  }

  Widget _buildCategoryField(
    BuildContext context,
    CreateItemViewModel viewModel,
  ) {
    return DropdownButtonFormField<Category>(
      value: viewModel.selectedCategory,
      onChanged: (value) {
        if (value != null) {
          viewModel.selectedCategory = value;
        }
      },
      items: Category.values
          .where((element) => element != Category.all)
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: kdFieldLabelFontSize,
                ),
              ),
            ),
          )
          .toList(),
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kcLightGrey),
          borderRadius: BorderRadius.all(
            Radius.circular(
              kdFieldBorderRadius,
            ),
          ),
        ),
        label: Text(
          'Category',
          style: TextStyle(
            fontSize: kdFieldLabelFontSize,
            color: kcMediumGrey,
          ),
        ),
      ),
    );
  }

  Widget _buildPicturePicker(
    BuildContext context,
    CreateItemViewModel viewModel,
  ) {
    return Column(
      children: [
        const Text(
          'Add a picture for your item',
          style: TextStyle(
            fontSize: kdSubtitleSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpaceSmall,
        ...viewModel.selectedPicture.fold(
          () => [const SizedBox.shrink()],
          (data) => [
            verticalSpaceSmall,
            Image.memory(
              data.bytes,
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
          ],
        ),
        verticalSpaceSmall,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  await viewModel.updatePicture();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: kButtonSize,
                  backgroundColor: kcBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kdFieldBorderRadius),
                  ),
                ),
                child: const Text(
                  'Pick picture',
                  style: TextStyle(
                    color: kcWhite,
                    fontSize: kdButtonTextSize,
                  ),
                ),
              ),
            ),
            horizontalSpaceSmall,
            if (viewModel.selectedPicture.isSome())
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.selectedPicture = none();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: kButtonSize,
                    backgroundColor: kcRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kdFieldBorderRadius),
                    ),
                  ),
                  child: const Text(
                    'Remove picture',
                    style: TextStyle(
                      color: kcWhite,
                      fontSize: kdButtonTextSize,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildCreateItemButton(
    BuildContext context,
    CreateItemViewModel viewModel,
  ) {
    return Column(
      children: [
        if (viewModel.busy(ksCreateItemKey)) ...[
          const LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kcBlue),
          ),
          verticalSpaceTiny,
        ],
        ElevatedButton(
          onPressed: () async {
            await viewModel.createItem();

            if (!context.mounted) return;

            if (viewModel.hasErrorForKey(ksCreateItemKey)) {
              await context.showErrorBar(
                position: FlashPosition.top,
                indicatorColor: kcRed,
                content: Text(
                  viewModel.error(ksCreateItemKey).message as String,
                ),
                primaryActionBuilder: (context, controller) {
                  return IconButton(
                    onPressed: controller.dismiss,
                    icon: const Icon(Icons.close),
                  );
                },
              );
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: kButtonSize,
            backgroundColor: kcBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kdFieldBorderRadius),
            ),
          ),
          child: const Text(
            'Create item',
            style: TextStyle(
              color: kcWhite,
              fontSize: kdButtonTextSize,
            ),
          ),
        ),
      ],
    );
  }

  @override
  CreateItemViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateItemViewModel();

  @override
  Future<void> onViewModelReady(CreateItemViewModel viewModel) async {
    final hasCurrentUser = await JwtStorage.hasCurrentUser();
    if (!hasCurrentUser) {
      viewModel.routerService.replaceWithRegisterView();
    }

    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(CreateItemViewModel viewModel) {
    disposeForm();
  }
}
