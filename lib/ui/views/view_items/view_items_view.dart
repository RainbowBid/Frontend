import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../../models/items/item.dart';
import '../../common/app_colors.dart';
import '../../common/app_constants.dart';
import 'view_items_viewmodel.dart';

class ViewItemsView extends StatelessWidget {
  const ViewItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewItemsViewModel>.reactive(
      builder: (context, viewModel, child) => viewModel.isBusy
          ? const CircularProgressIndicator()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Your items", style: TextStyle(fontSize: 20)),
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
                      child: ListTile(
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
                          final item = viewModel.data![index];
                          await viewModel.routerService
                              .replaceWithItemDetailsView(id: item.id);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
      viewModelBuilder: () => ViewItemsViewModel(),
    );
  }
}
