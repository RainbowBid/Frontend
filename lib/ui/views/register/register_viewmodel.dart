import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.logger.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/api_error.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auth_service.dart';
import 'package:rainbowbid_frontend/models/register_model.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  final _logger = getLogger('RegisterViewModel');
  final _authService = locator<IAuthService>();
  final _routerService = locator<RouterService>();

  Future<void> _register() async {
    // TODO: check whether register credentials are valid

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
        await _routerService.replaceWith(const HomeViewRoute());
      },
    );
  }

  Future<void> register() async {
    await runBusyFuture(
      _register(),
      busyObject: ksRegisterKey,
    );
  }
}
