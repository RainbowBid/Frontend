import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/errors/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auth_service.dart';
import 'package:rainbowbid_frontend/models/auth/register_model.dart';
import 'package:rainbowbid_frontend/models/validators/user_validator.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/views/register/register_view.form.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  final _logger = getLogger('RegisterViewModel');
  final _authService = locator<IAuthService>();
  final _routerService = locator<RouterService>();
  final _sidebarController = SidebarXController(
    selectedIndex: kiSidebarRegisterMenuIndex,
  );

  late bool _isPasswordVisible = false;
  late bool _isConfirmPasswordVisible = false;

  SidebarXController get sidebarController => _sidebarController;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> _register() async {
    _logger.i('Registering user');
    await _validate();

    _logger.i('Validation successful');
    final request = RegisterModel(
      name: nameValue!,
      email: emailValue!,
      password: passwordValue!,
    );

    final response = await _authService.register(request);

    await response.fold(
      (ApiError error) {
        throw Exception(error.message);
      },
      (unit) async {
        await _routerService.replaceWithHomeView();
      },
    );
  }

  Future<void> register() async {
    await runBusyFuture(
      _register(),
      busyObject: ksRegisterKey,
    );
  }

  Future<void> _validate() async {
    if (hasNameValidationMessage) {
      throw Exception(nameValidationMessage);
    }

    if (hasEmailValidationMessage) {
      throw Exception(emailValidationMessage);
    }

    if (hasPasswordValidationMessage) {
      throw Exception(passwordValidationMessage);
    }

    final confirmPasswordValidationMessage =
        UserValidator.validateConfirmPassword(
      passwordValue,
      confirmPasswordValue,
    );

    if (confirmPasswordValidationMessage != null) {
      throw Exception(confirmPasswordValidationMessage);
    }
  }
}
