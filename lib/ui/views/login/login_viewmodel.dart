import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/auth/login_model.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auth_service.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/views/login/login_view.form.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _logger = getLogger('LoginViewModel');
  final _authService = locator<IAuthService>();
  final _routerService = locator<RouterService>();
  final _sidebarController = SidebarXController(
    selectedIndex: kiSidebarLoginMenuIndex,
  );

  late bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;
  SidebarXController get sidebarController => _sidebarController;
  RouterService get routerService => _routerService;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> login() async {
    await runBusyFuture(
      _login(),
      busyObject: ksLoginKey,
    );
  }

  Future<void> _login() async {
    _logger.i('User ${emailValue!} logs in.');
    await _validate();

    _logger.i('Validation successful');
    final request = LoginModel(
      email: emailValue!,
      password: passwordValue!,
    );

    final response = await _authService.login(request);

    await response.fold(
      (ApiError error) {
        throw Exception(error.message);
      },
      (unit) async {
        await _routerService.replaceWithHomeView();
      },
    );
  }

  Future<void> _validate() async {
    if (hasEmailValidationMessage) {
      throw Exception(emailValidationMessage);
    }

    if (hasPasswordValidationMessage) {
      throw Exception(passwordValidationMessage);
    }
  }
}
