import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';
import 'package:rainbowbid_frontend/models/validators/user_validator.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/login/login_view.form.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
    validator: UserValidator.validateEmail,
  ),
  FormTextField(
    name: 'password',
    validator: UserValidator.validatePassword,
  ),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: AppSidebar(
        controller: viewModel.sidebarController,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppSidebar(
            controller: viewModel.sidebarController,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(kdPagePadding),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(kdFormPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildRegisterPageTitle(context),
                          verticalSpaceLarge,
                          Column(
                            children: [
                              Row(
                                children: [
                                  _buildEmailField(context, viewModel),
                                ],
                              ),
                              verticalSpaceLarge,
                              Row(
                                children: [
                                  _buildPasswordField(context, viewModel),
                                ],
                              ),
                              verticalSpaceMedium,
                              _buildLoginButton(context, viewModel),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterPageTitle(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Login',
          style: TextStyle(
            fontSize: kdTitleSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpaceSmall,
        Text(
          'Log in to find your dreamed auction.',
          style: TextStyle(
            fontSize: kdSubtitleSize,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField(BuildContext context, LoginViewModel viewModel) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            focusNode: emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusedBorder: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kcLightGrey),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kdFieldBorderRadius,
                  ),
                ),
              ),
              label: RichText(
                text: const TextSpan(
                  text: 'Email',
                  style: TextStyle(
                    fontSize: kdFieldLabelFontSize,
                    color: kcMediumGrey,
                  ),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: kcRed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (viewModel.hasEmailValidationMessage) ...[
            verticalSpaceTiny,
            Text(
              viewModel.emailValidationMessage!,
              style: const TextStyle(
                color: kcRed,
                fontSize: kdFieldValidationFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context, LoginViewModel viewModel) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          TextFormField(
            controller: passwordController,
            focusNode: passwordFocusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: !viewModel.isPasswordVisible,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusedBorder: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kcLightGrey),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kdFieldBorderRadius,
                  ),
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  viewModel.togglePasswordVisibility();
                },
                icon: Icon(
                  viewModel.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: kcBlack,
                ),
              ),
              label: RichText(
                text: const TextSpan(
                  text: 'Password',
                  style: TextStyle(
                    fontSize: kdFieldLabelFontSize,
                    color: kcMediumGrey,
                  ),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: kcRed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (viewModel.hasPasswordValidationMessage) ...[
            verticalSpaceTiny,
            Text(
              viewModel.passwordValidationMessage!,
              style: const TextStyle(
                color: kcRed,
                fontSize: kdFieldValidationFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return Column(
      children: [
        if (viewModel.busy(ksLoginKey)) ...[
          const LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kcBlue),
          ),
          verticalSpaceTiny,
        ],
        ElevatedButton(
          onPressed: () async {
            await viewModel.login();

            if (!context.mounted) return;

            if (viewModel.hasErrorForKey(ksLoginKey)) {
              await context.showErrorBar(
                position: FlashPosition.top,
                indicatorColor: kcRed,
                content: Text(
                  viewModel.error(ksLoginKey).message as String,
                ),
                primaryActionBuilder: (context, controller) {
                  return IconButton(
                    onPressed: controller.dismiss,
                    icon: const Icon(Icons.close),
                  );
                },
              );
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: kButtonSize,
            backgroundColor: kcBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kdFieldBorderRadius),
            ),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
              color: kcWhite,
              fontSize: kdButtonTextSize,
            ),
          ),
        ),
        verticalSpaceMedium,
        RichText(
          text: TextSpan(
            text: 'Don\'t have an account? ',
            style: const TextStyle(
              color: kcMediumGrey,
            ),
            children: [
              TextSpan(
                text: 'Register',
                style: const TextStyle(
                  color: kcBlack,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    viewModel.routerService.replaceWithRegisterView();
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Future<void> onViewModelReady(LoginViewModel viewModel) async {
    final hasCurrentUser = await JwtStorage.hasCurrentUser();
    if (hasCurrentUser) {
      viewModel.routerService.replaceWithHomeView();
    }

    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
