import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

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
            child: Text("item details works ${viewModel.data!.toJson()}"),
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  ItemDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ItemDetailsViewModel(itemId: id);
}
