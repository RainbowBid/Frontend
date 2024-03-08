import 'package:rainbowbid_frontend/models/interfaces/i_auth_service.dart';
import 'package:rainbowbid_frontend/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:rainbowbid_frontend/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:rainbowbid_frontend/ui/views/home/home_view.dart';
import 'package:rainbowbid_frontend/ui/views/startup/startup_view.dart';
import 'package:rainbowbid_frontend/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:rainbowbid_frontend/services/auth_service.dart';
import 'package:rainbowbid_frontend/ui/views/register/register_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: HomeView),
    CustomRoute(page: RegisterView, path: '/register'),
    CustomRoute(page: UnknownView, path: '/404'),
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
