import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/auction_details/auction_details_viewmodel.dart';
import 'package:rainbowbid_frontend/ui/views/create_bid/create_bid_view.dart';
import 'package:rainbowbid_frontend/ui/views/view_bids/view_bids_view.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:stacked/stacked.dart';

import '../../../models/auctions/auction.dart';

class AuctionDetailsView extends StatelessWidget {
  final String itemId;
  final String ownerId;

  const AuctionDetailsView({
    required this.itemId,
    required this.ownerId,
    super.key,
  });

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
                return auction.isExpired && auction.needsFinalApproval
                    ? FutureBuilder<Option<String>>(
                        future: JwtStorage.getUserId(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }

                          if (snapshot.hasData) {
                            return snapshot.data!.fold(
                              () => const SizedBox.shrink(),
                              (value) => value == ownerId
                                  ? _buildConfirmationWidgetForOwner(
                                      viewModel, auction.id)
                                  : _buildInformativeWidgetForBidder(),
                            );
                          }

                          return const SizedBox.shrink();
                        })
                    : _buildOngoingAuctionDetails(auction);
              },
            ),
      viewModelBuilder: () => AuctionDetailsViewModel(itemId: itemId),
    );
  }

  Widget _buildOngoingAuctionDetails(Auction auction) {
    return Column(
      children: [
        Card(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
        verticalSpaceSmall,
        const Divider(),
        verticalSpaceSmall,
        FutureBuilder<Option<String>>(
          future: JwtStorage.getUserId(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              return snapshot.data!.fold(
                () => const SizedBox.shrink(),
                (currentUserId) => currentUserId != ownerId
                    ? CreateBidView(auctionId: auction.id)
                    : const SizedBox.shrink(),
              );
            }

            return const SizedBox.shrink();
          },
        ),
        verticalSpaceSmall,
        const Divider(),
        verticalSpaceSmall,
        FutureBuilder<Option<String>>(
          future: JwtStorage.getUserId(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              return snapshot.data!.fold(
                () => const SizedBox.shrink(),
                (_) => ViewBidsView(auctionId: auction.id),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildConfirmationWidgetForOwner(
    AuctionDetailsViewModel viewModel,
    String auctionId,
  ) {
    return Column(
      children: [
        const Text(
          'The auction has ended and needs final approval before the exchange can be completed.',
          style: TextStyle(
            fontSize: kdTitleSize,
            color: kcBlack,
          ),
        ),
        verticalSpaceLarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                await viewModel.confirmAuctionFinalization(auctionId, true);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: kButtonSize,
                backgroundColor: kcGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kdFieldBorderRadius),
                ),
              ),
              child: const Text(
                "Approve",
                style: TextStyle(
                  color: kcBlack,
                  fontSize: kdButtonTextSize,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.confirmAuctionFinalization(auctionId, false);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: kButtonSize,
                backgroundColor: kcRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kdFieldBorderRadius),
                ),
              ),
              child: const Text(
                "Reject",
                style: TextStyle(
                  color: kcBlack,
                  fontSize: kdButtonTextSize,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInformativeWidgetForBidder() {
    return const Center(
      child: Text('Please wait for the owner to confirm the exchange.'),
    );
  }
}
