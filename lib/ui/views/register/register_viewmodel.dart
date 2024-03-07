import 'dart:io';

import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/interfaces/i_auth_service.dart';
import 'package:rainbowbid_frontend/models/register_model.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  final _authService = locator<IAuthService>();
  final _routerService = locator<RouterService>();

  Future<void> _register() async {
    final request = RegisterModel(
      name: nameValue,
      email: emailValue,
      password: passwordValue,
    );

    final res = await _authService.register(request);

    if (res.response.statusCode == HttpStatus.created) {
      // inform viewmodel
      await _routerService.replaceWith(const HomeViewRoute());
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<void> register() async {
    await runBusyFuture(
      _register(),
      busyObject: ksRegisterKey,
    );
  }
}
