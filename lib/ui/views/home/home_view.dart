import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/home/home_viewmodel.dart';
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
              padding: const EdgeInsets.all(8.0),
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
                  FutureBuilder(
                    future: JwtStorage.hasCurrentUser(),
                    initialData: false,
                    builder: (context, snapshot) => snapshot.connectionState ==
                            ConnectionState.done
                        ? Column(
                            children: [
                              if (snapshot.hasData && snapshot.data! == true)
                                const ViewItemsView(),
                            ],
                          )
                        : const CircularProgressIndicator(),
                  ),
                ],
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
