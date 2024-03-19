import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/items/item.dart';
import '../../common/app_colors.dart';
import '../../common/app_constants.dart';
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
                              category.name,
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(viewModel.data![index].id.toString()),
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
