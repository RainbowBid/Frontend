import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/config/api_constants.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/auction_details/auction_details_view.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

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
                                                  fontSize: 20,
                                                ),
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
                            AuctionDetailsView(itemId: viewModel.data!.id),
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
      future: item.getJwtForImageRequest(),
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
                  ApiConstants.itemsGetImageByItemIdUrl.replaceFirst(
                    ":id",
                    item.id,
                  ),
                ).toString(),
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

  @override
  ItemDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ItemDetailsViewModel(itemId: id);
}
