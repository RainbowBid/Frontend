import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/items/item.dart';
import 'view_items_viewmodel.dart';

class ViewItemsView extends StackedView<ViewItemsViewModel> {
  const ViewItemsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ViewItemsViewModel viewModel,
    Widget? child,
  ) {
    return FutureBuilder<List<Item>>(
      initialData: [],
      future: viewModel.getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Item> items = snapshot.data!;
          return Column(
            children: [
              ListTile(
                title: Text("Your items"),
                subtitle: Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(items[index].id.toString()),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  ViewItemsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewItemsViewModel();
}
