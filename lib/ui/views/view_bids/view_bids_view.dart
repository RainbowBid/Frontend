import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/view_bids/view_bids_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ViewBidsView extends StatelessWidget {
  final String auctionId;

  const ViewBidsView({required this.auctionId, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewBidsViewModel>.reactive(
      builder: (context, viewModel, child) => viewModel.isBusy
          ? const CircularProgressIndicator()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.refresh,
                        size: 25,
                        color: kcWhite,
                      ),
                      onPressed: () => viewModel.refresh(),
                      label: const Text(
                        "Refresh",
                        style: TextStyle(
                          fontSize: 15,
                          color: kcWhite,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kcBlue,
                      ),
                    ),
                    horizontalSpaceSmall,
                    const Text(
                      "Bids",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.data!.length,
                  itemBuilder: (context, index) {
                    final bid = viewModel.data![index];
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
                                  Text(
                                    "Bid value: ${bid.value}",
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                  verticalSpaceSmall,
                                  Text(
                                    "Bidder: ${bid.username}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      color: kcRed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                verticalSpaceMedium,
              ],
            ),
      viewModelBuilder: () => ViewBidsViewModel(auctionId: auctionId),
    );
  }
}
