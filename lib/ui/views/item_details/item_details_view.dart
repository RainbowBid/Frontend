import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../models/auctions/auction.dart';
import '../../../models/items/item.dart';
import 'item_details_viewmodel.dart';

class ItemDetailsView extends StackedView<ItemDetailsViewModel> {
  final String id;

  ItemDetailsView({@PathParam() required this.id, super.key});

  @override
  Widget builder(
    BuildContext context,
    ItemDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: viewModel.isBusy
          ? const CircularProgressIndicator()
          : viewModel.hasError
              ? Text("Error occured : ${viewModel.modelError.toString()}")
              : Row(
                  children: [
                    AppSidebar(controller: viewModel.sidebarController),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipOval(
                                              child: _buildImageWidget(
                                                  viewModel.data!)),
                                          horizontalSpaceMedium,
                                          Column(
                                            children: [
                                              Text(
                                                viewModel.data!.brief,
                                                style:
                                                    const TextStyle(fontSize: 30),
                                              ),
                                              Text(
                                                viewModel.data!.category.value,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontStyle: FontStyle.italic),
                                              ),
                                              const Divider(),
                                            ],
                                          ),
                                        ],
                                      ),
                                      verticalSpaceSmall,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            viewModel.data!.description,
                                            style: const TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          _buildAuctionWidget(viewModel, id),
                        ],
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
                HttpHeaders.authorizationHeader: "Bearer ${jwt}",
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
                // No auction available
                return FutureBuilder<void>(
                  future: viewModel.routerService.replaceWithCreateAuctionView(
                    itemId: viewModel.itemId,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // After replacing with create auction view
                      return const SizedBox.shrink();
                    } else {
                      // While waiting for future to complete
                      return const CircularProgressIndicator();
                    }
                  },
                );
              },
              (auction) {
                // Display auction details
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Ongoing Auction",
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height *0.05,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Starting price : ${auction.startingPrice}"),
                                const Text("Highest bid takes the stake!")
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height *0.025,),
                            Text("End date : ${auction.endDate}"),
                          ],
                        ),
                      ),
                    ],
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
