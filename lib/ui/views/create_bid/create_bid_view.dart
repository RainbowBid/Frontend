import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rainbowbid_frontend/models/validators/auction_validator.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/create_bid/create_bid_view.form.dart';
import 'package:rainbowbid_frontend/ui/views/create_bid/create_bid_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(
    name: 'value',
    validator: AuctionValidator.validatePrice,
  ),
])
class CreateBidView extends StatelessWidget with $CreateBidView {
  final String auctionId;

  const CreateBidView({required this.auctionId, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateBidViewModel>.reactive(
      builder: (context, viewModel, child) => viewModel.isBusy
          ? const CircularProgressIndicator()
          : Column(
              children: [
                _buildValueField(context, viewModel),
                verticalSpaceMedium,
                _buildCreateBidButton(context, viewModel),
              ],
            ),
      viewModelBuilder: () => CreateBidViewModel(auctionId: auctionId),
      onViewModelReady: (viewModel) => syncFormWithViewModel(viewModel),
    );
  }

  Widget _buildValueField(
    BuildContext context,
    CreateBidViewModel viewModel,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: valueController,
          focusNode: valueFocusNode,
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
                text: 'Bid value',
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
        if (viewModel.hasValueValidationMessage) ...[
          verticalSpaceTiny,
          Text(
            viewModel.valueValidationMessage!,
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

  Widget _buildCreateBidButton(
    BuildContext context,
    CreateBidViewModel viewModel,
  ) {
    return Column(
      children: [
        if (viewModel.busy(ksCreateBidKey)) ...[
          const LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kcBlue),
          ),
          verticalSpaceTiny,
        ],
        ElevatedButton(
          onPressed: () async {
            await viewModel.createBid();

            if (!context.mounted) return;

            if (viewModel.hasErrorForKey(ksCreateBidKey)) {
              await context.showErrorBar(
                position: FlashPosition.top,
                indicatorColor: kcRed,
                content: Text(
                  viewModel.error(ksCreateBidKey).message as String,
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
            'Place your bid',
            style: TextStyle(
              color: kcWhite,
              fontSize: kdButtonTextSize,
            ),
          ),
        ),
      ],
    );
  }
}
