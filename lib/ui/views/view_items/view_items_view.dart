import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:stacked/stacked.dart';

import 'view_items_viewmodel.dart';

class ViewItemsView extends StackedView<ViewItemsViewModel> {
  const ViewItemsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ViewItemsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: viewModel.isBusy
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Text("Your items"),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(viewModel.data![index].id.toString()),
                            onTap: () async {
                              final item = viewModel.data![index];
                              await viewModel.routerService.replaceWithItemDetailsView(id: item.id, item: item);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }

  @override
  ViewItemsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewItemsViewModel();
}
