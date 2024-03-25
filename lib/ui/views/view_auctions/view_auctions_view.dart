import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/items/item.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/view_auctions/view_auctions_viewmodel.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:stacked/stacked.dart';

class ViewAuctionsView extends StatelessWidget {
  const ViewAuctionsView({
    required this.currentUserId,
    super.key,
  });

  final Option<String> currentUserId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewAuctionsViewModel>.reactive(
      builder: (context, viewModel, child) => viewModel.isBusy
          ? const CircularProgressIndicator()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Ongoing auctions",
                  style: TextStyle(fontSize: 20),
                ),
                verticalSpaceMedium,
                DropdownButtonFormField<Category>(
                  value: viewModel.selectedCategory,
                  onChanged: (value) async {
                    if (value != null) {
                      viewModel.selectedCategory = value;
                      await viewModel.refresh();
                    }
                  },
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.displayValue,
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
                ),
                verticalSpaceSmall,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              viewModel.data![index].brief.toString(),
                            ),
                            subtitle: Text(
                              viewModel.data![index].description.toString(),
                            ),
                            trailing: Chip(
                              label: Text(
                                viewModel.data![index].category.displayValue,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: kcRed.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              color: MaterialStateColor.resolveWith(
                                (states) => kcRed.withOpacity(0.5),
                              ),
                            ),
                            onTap: () async {
                              currentUserId.fold(
                                () {},
                                (_) async {
                                  await viewModel.routerService
                                      .replaceWithItemDetailsView(
                                    id: viewModel.data![index].itemId,
                                  );
                                },
                              );
                            },
                          ),
                          verticalSpaceTiny,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Ends in : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SlideCountdown(
                                      duration: viewModel.data![index].endDate
                                          .difference(
                                        DateTime.now(),
                                      ),
                                      slideDirection: SlideDirection.up,
                                      separatorType: SeparatorType.symbol,
                                      separator: ":",
                                    ),
                                  ],
                                ),
                                verticalSpaceMedium,
                                Text(
                                  "Starting price : ${viewModel.data![index].startingPrice}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                horizontalSpaceSmall,
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
      viewModelBuilder: () => ViewAuctionsViewModel(),
    );
  }
}
