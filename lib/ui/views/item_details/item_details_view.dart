import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../models/auctions/auction.dart';
import '../../../models/items/item.dart';
import 'item_details_viewmodel.dart';

class ItemDetailsView extends StackedView<ItemDetailsViewModel> {
  final String id;

  const ItemDetailsView({@PathParam() required this.id, super.key});

  @override
  Widget builder(
    BuildContext context,
    ItemDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasError
              ? Center(
                  child: Text(
                    "Error occurred : ${viewModel.modelError.toString()}",
                  ),
                )
              : Row(
                  children: [
                    AppSidebar(controller: viewModel.sidebarController),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipOval(
                                                child: _buildImageWidget(
                                                  viewModel.data!,
                                                ),
                                              ),
                                              horizontalSpaceMedium,
                                              Text(
                                                viewModel.data!.brief,
                                                style: const TextStyle(
                                                    fontSize: 30),
                                              ),
                                              horizontalSpaceMedium,
                                              Chip(
                                                label: Text(
                                                  viewModel
                                                      .data!.category.value,
                                                  style: const TextStyle(
                                                    fontSize: 25,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color:
                                                        kcRed.withOpacity(0.5),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    20,
                                                  ),
                                                ),
                                                color: MaterialStateColor
                                                    .resolveWith(
                                                  (states) =>
                                                      kcRed.withOpacity(0.5),
                                                ),
                                              ),
                                              const Divider(),
                                            ],
                                          ),
                                          verticalSpaceSmall,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                viewModel.data!.description,
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
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
                            _buildAuctionWidget(viewModel, id),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildImageWidget(Item item) {
    return FutureBuilder<Option<String>>(
      future: item.getJwtForGetImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return snapshot.data!.fold(() {
              return const SizedBox.shrink();
            }, (jwt) {
              Map<String, String> heads = {
                HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
                HttpHeaders.authorizationHeader: "Bearer $jwt",
              };
              return Image.network(
                Uri.http(
                        ApiConstants.baseUrl,
                        ApiConstants.itemsGetImageByItemIdUrl
                            .replaceFirst(":id", item.id))
                    .toString(),
                headers: heads,
              );
            });
          } else {
            return const SizedBox.shrink();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildAuctionWidget(ItemDetailsViewModel viewModel, String itemId) {
    return FutureBuilder<Option<Auction>>(
      future: viewModel.getAuctionByItemId(itemId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final option = snapshot.data!;
            return option.fold(
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
            );
          } else {
            // No data available
            return const SizedBox.shrink();
          }
        } else {
          // Loading indicator
          return const CircularProgressIndicator();
        }
      },
    );
  }

  //
  // Widget _buildAuctionWidget(ItemDetailsViewModel viewModel, String itemId) {
  //   return FutureBuilder<Either<ApiError, Auction>>(
  //     future: viewModel.auctionService.getAuctionByItemId(itemId),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         final result = snapshot.data;
  //         if (result != null && result.isLeft()) {
  //           final apiError = result.leftMap((error) => error);
  //           return Text("Error occurred: ${apiError.getOrElse(() => ApiError.unknownError).message}");
  //         } else if (result != null && result.isRight()) {
  //           final auction = result.rightMap((auction) => auction);
  //           return Row(
  //             children: [
  //               const Text("Active auction, if any exists."),
  //               Center(
  //                 child: TextButton(
  //                   onPressed: () async {
  //                     await viewModel.routerService.replaceWithCreateAuctionView(
  //                       itemId: viewModel.itemId,
  //                     );
  //                   },
  //                   child: const Text('Create Auction'),
  //                 ),
  //               ),
  //             ],
  //           );
  //         } else {
  //           return const SizedBox.shrink();
  //         }
  //       } else {
  //         return const CircularProgressIndicator();
  //       }
  //     },
  //   );
  // }

  @override
  ItemDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ItemDetailsViewModel(itemId: id);
}
