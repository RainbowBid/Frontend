import 'package:dartz/dartz.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/ui/views/create_auction/create_auction_view.form.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../models/auth/jwt_storage.dart';
import '../../../models/validators/auction_validator.dart';
import '../../common/app_colors.dart';
import '../../common/app_constants.dart';
import '../../common/ui_helpers.dart';
import 'create_auction_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'startingPrice',
    validator: AuctionValidator.validatePrice,
  ),
])
class CreateAuctionView extends StackedView<CreateAuctionViewModel>
    with $CreateAuctionView {
  final String itemId;

  const CreateAuctionView({@PathParam() required this.itemId, super.key});

  @override
  Widget builder(
    BuildContext context,
    CreateAuctionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppSidebar(controller: viewModel.sidebarController),
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
                      children: [
                        _buildCreateItemPageTitle(context),
                        verticalSpaceLarge,
                        _buildStartingPriceField(context, viewModel),
                        verticalSpaceSmall,
                        _buildEndDateField(context, viewModel),
                        verticalSpaceMedium,
                        _buildCreateAuctionButton(context, viewModel),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCreateItemPageTitle(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Create auction',
          style: TextStyle(
            fontSize: kdTitleSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpaceSmall,
        Text(
          'Have the bids flowing now!',
          style: TextStyle(
            fontSize: kdSubtitleSize,
          ),
        ),
      ],
    );
  }

  Widget _buildStartingPriceField(
    BuildContext context,
    CreateAuctionViewModel viewModel,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: startingPriceController,
          focusNode: startingPriceFocusNode,
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                text: 'Starting Price',
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
          inputFormatters: [ThousandsFormatter(allowFraction: true)],
        ),
        if (viewModel.hasStartingPriceValidationMessage) ...[
          verticalSpaceTiny,
          Text(
            viewModel.startingPriceValidationMessage!,
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

  Widget _buildEndDateField(
    BuildContext context,
    CreateAuctionViewModel viewModel,
  ) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            final pickedDate = await showOmniDateTimePicker(
              context: context,
            );

            if (pickedDate != null) {
              viewModel.endDate = some(pickedDate);
            }
          },
          icon: const Icon(
            Icons.calendar_today,
            color: kcWhite,
          ),
          label: viewModel.endDate.fold(
            () => const Text(
              'Select end date',
              style: TextStyle(
                color: kcWhite,
              ),
            ),
            (endDate) => Text(
              'End date: ${endDate.toIso8601String()}',
              style: const TextStyle(
                color: kcWhite,
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: kButtonSize,
            backgroundColor: kcPrimaryColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kdFieldBorderRadius),
            ),
          ),
        ),
        if (viewModel.hasEndDateValidationMessage) ...[
          verticalSpaceTiny,
          Text(
            viewModel.endDateValidationMessage!,
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

  Widget _buildCreateAuctionButton(
    BuildContext context,
    CreateAuctionViewModel viewModel,
  ) {
    return Column(
      children: [
        if (viewModel.busy(ksCreateAuctionKey)) ...[
          const LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kcBlue),
          ),
          verticalSpaceTiny,
        ],
        ElevatedButton(
          onPressed: () async {
            await viewModel.createAuction();

            if (!context.mounted) return;

            if (viewModel.hasErrorForKey(ksCreateAuctionKey)) {
              await context.showErrorBar(
                position: FlashPosition.top,
                indicatorColor: kcRed,
                content: Text(
                  viewModel.error(ksCreateAuctionKey).message as String,
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
            'Create auction',
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
  CreateAuctionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateAuctionViewModel(itemId: itemId);

  @override
  Future<void> onViewModelReady(CreateAuctionViewModel viewModel) async {
    final hasCurrentUser = await JwtStorage.hasCurrentUser();
    if (!hasCurrentUser) {
      viewModel.routerService.replaceWithLoginView();
    }

    syncFormWithViewModel(viewModel);
  }
}
