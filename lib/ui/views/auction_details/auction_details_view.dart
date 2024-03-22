import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/auction_details/auction_details_viewmodel.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:stacked/stacked.dart';

class AuctionDetailsView extends StatelessWidget {
  final String itemId;

  const AuctionDetailsView({required this.itemId, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuctionDetailsViewModel>.reactive(
      builder: (context, viewModel, child) => viewModel.isBusy
          ? const CircularProgressIndicator()
          : viewModel.data!.fold(
              () {
                return ElevatedButton(
                  onPressed: () async {
                    await viewModel.routerService.replaceWithCreateAuctionView(
                      itemId: viewModel.itemId,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: kButtonSize,
                    backgroundColor: kcBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kdFieldBorderRadius),
                    ),
                  ),
                  child: const Text(
                    "Create auction",
                    style: TextStyle(
                      color: kcWhite,
                      fontSize: kdButtonTextSize,
                    ),
                  ),
                );
              },
              (auction) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Ongoing Auction",
                                style: TextStyle(fontSize: 30, color: kcRed),
                              ),
                              verticalSpaceSmall,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Starting price : ${auction.startingPrice}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "Highest bid takes the stake!",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: kcRed,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpaceSmall,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Ends in : ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SlideCountdown(
                                    duration: auction.endDate.difference(
                                      DateTime.now(),
                                    ),
                                    slideDirection: SlideDirection.up,
                                    separatorType: SeparatorType.title,
                                    separator: ":",
                                  ),
                                ],
                              ),
                              verticalSpaceMedium,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      viewModelBuilder: () => AuctionDetailsViewModel(itemId: itemId),
    );
  }
}
