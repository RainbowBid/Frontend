import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../models/validators/item_validator.dart';
import '../../common/app_constants.dart';
import '../../common/ui_helpers.dart';
import 'create_auction_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'startingPrice',
    validator: ItemValidator.validateStartingPrice,
  ),
  FormTextField(
    name: 'endDate',
    validator: ItemValidator.validateEndDate,
  ),
])
class CreateAuctionView extends StackedView<CreateAuctionViewModel>
    with $CreateAuctionView {
  const CreateAuctionView({super.key});

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
                          _buildStartingPriceField(),
                          verticalSpaceMedium,
                          _buildEndDateField(),
                        ],
                      ),
                    )),
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

  Widget _buildBriefField(
      BuildContext context,
      CreateAuctionViewModel viewModel,
      ) {
    return Column(
      children: [
        TextFormField(
          controller: startingPriceController,
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

  @override
  CreateAuctionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateAuctionViewModel();
}
