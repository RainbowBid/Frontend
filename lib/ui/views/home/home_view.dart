import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/home/home_viewmodel.dart';
import 'package:rainbowbid_frontend/ui/views/view_auctions/view_auctions_view.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:stacked/stacked.dart';

import '../view_items/view_items_view.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppSidebar(
            controller: viewModel.sidebarController,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpaceSmall,
                    const Text(
                      'Welcome to RainbowBid! 🌈',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpaceLarge,
                    FutureBuilder<Option<String>>(
                      future: JwtStorage.getUserId(),
                      initialData: none(),
                      builder: (context, snapshot) =>
                          snapshot.connectionState == ConnectionState.done
                              ? Column(
                                  children: [
                                    if (snapshot.hasData &&
                                        snapshot.data!.isNone()) ...[
                                      const Text(
                                        'You are not logged in. Please log in to view your items and auctions.',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: kcRed,
                                        ),
                                      ),
                                      verticalSpaceSmall,
                                    ],
                                    if (snapshot.hasData)
                                      ViewAuctionsView(
                                        currentUserId: snapshot.data!,
                                      ),
                                    verticalSpaceLarge,
                                    if (snapshot.hasData &&
                                        snapshot.data!.isSome())
                                      const ViewItemsView(),
                                  ],
                                )
                              : const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
