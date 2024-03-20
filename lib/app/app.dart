import 'package:rainbowbid_frontend/models/interfaces/i_auth_service.dart';
import 'package:rainbowbid_frontend/services/items_service.dart';

import 'package:rainbowbid_frontend/models/interfaces/i_items_service.dart';
import 'package:rainbowbid_frontend/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:rainbowbid_frontend/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:rainbowbid_frontend/ui/views/home/home_view.dart';
import 'package:rainbowbid_frontend/ui/views/startup/startup_view.dart';
import 'package:rainbowbid_frontend/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:rainbowbid_frontend/services/auth_service.dart';
import 'package:rainbowbid_frontend/ui/views/register/register_view.dart';
import 'package:rainbowbid_frontend/ui/views/login/login_view.dart';
import 'package:rainbowbid_frontend/ui/views/view_items/view_items_view.dart';

import '../models/interfaces/i_auctions_service.dart';

import 'package:rainbowbid_frontend/ui/views/create_item/create_item_view.dart';
import 'package:rainbowbid_frontend/ui/views/item_details/item_details_view.dart';
import 'package:rainbowbid_frontend/ui/views/create_auction/create_auction_view.dart';

import '../services/auctions_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: HomeView),
    CustomRoute(page: RegisterView, path: '/auth/register'),
    CustomRoute(page: LoginView, path: '/auth/login'),
    CustomRoute(
      page: CreateItemView,
      path: '/items/create',
    ),
    CustomRoute(page: UnknownView, path: '/404'),
    CustomRoute(page: ViewItemsView, path: '/items/all'),

    CustomRoute(page: ItemDetailsView, path: '/items/:id'),
    CustomRoute(page: CreateAuctionView, path: '/items/:id/auction'),
// @stacked-route

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(
      classType: AuthService,
      asType: IAuthService,
    ),
    LazySingleton(
      classType: ItemsService,
      asType: IItemsService,
    ),
    LazySingleton(
      classType: AuctionsService,
      asType: IAuctionService,
    ),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
