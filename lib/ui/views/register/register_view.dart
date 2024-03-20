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
import 'package:rainbowbid_frontend/ui/views/register/register_view.form.dart';
import 'package:rainbowbid_frontend/ui/widgets/app_primitives/app_sidebar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'name',
    validator: UserValidator.validateName,
  ),
  FormTextField(
    name: 'email',
    validator: UserValidator.validateEmail,
  ),
  FormTextField(
    name: 'password',
    validator: UserValidator.validatePassword,
  ),
  FormTextField(
    name: 'confirmPassword',
  ),
])
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildNameField(context, viewModel),
                                  horizontalSpaceLarge,
                                  _buildEmailField(context, viewModel),
                                ],
                              ),
                              verticalSpaceLarge,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildPasswordField(context, viewModel),
                                  horizontalSpaceLarge,
                                  _buildConfirmPasswordField(
                                      context, viewModel),
                                ],
                              ),
                              verticalSpaceMedium,
                              _buildRegisterButton(context, viewModel),
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
          'Register',
          style: TextStyle(
            fontSize: kdTitleSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpaceSmall,
        Text(
          'Create an account to start bidding',
          style: TextStyle(
            fontSize: kdSubtitleSize,
          ),
        ),
      ],
    );
  }

  Widget _buildNameField(BuildContext context, RegisterViewModel viewModel) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            focusNode: nameFocusNode,
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
                  text: 'Name',
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
          if (viewModel.hasNameValidationMessage) ...[
            verticalSpaceTiny,
            Text(
              viewModel.nameValidationMessage!,
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

  Widget _buildEmailField(BuildContext context, RegisterViewModel viewModel) {
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

  Widget _buildPasswordField(
      BuildContext context, RegisterViewModel viewModel) {
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

  Widget _buildConfirmPasswordField(
      BuildContext context, RegisterViewModel viewModel) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          TextFormField(
            controller: confirmPasswordController,
            focusNode: confirmPasswordFocusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: !viewModel.isConfirmPasswordVisible,
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
                  viewModel.toggleConfirmPasswordVisibility();
                },
                icon: Icon(
                  viewModel.isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: kcBlack,
                ),
              ),
              label: RichText(
                text: const TextSpan(
                  text: 'Confirm password',
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
          if (viewModel.hasConfirmPasswordValidationMessage) ...[
            verticalSpaceTiny,
            Text(
              viewModel.confirmPasswordValidationMessage!,
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

  Widget _buildRegisterButton(
      BuildContext context, RegisterViewModel viewModel) {
    return Column(
      children: [
        if (viewModel.busy(ksRegisterKey)) ...[
          const LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kcBlue),
          ),
          verticalSpaceTiny,
        ],
        ElevatedButton(
          onPressed: () async {
            await viewModel.register();

            if (!context.mounted) return;

            if (viewModel.hasErrorForKey(ksRegisterKey)) {
              await context.showErrorBar(
                position: FlashPosition.top,
                indicatorColor: kcRed,
                content: Text(
                  viewModel.error(ksRegisterKey).message as String,
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
            'Register',
            style: TextStyle(
              color: kcWhite,
              fontSize: kdButtonTextSize,
            ),
          ),
        ),
        verticalSpaceMedium,
        RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: const TextStyle(
              color: kcMediumGrey,
            ),
            children: [
              TextSpan(
                text: 'Login',
                style: const TextStyle(
                  color: kcBlack,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    viewModel.routerService.replaceWithLoginView();
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Future<void> onViewModelReady(RegisterViewModel viewModel) async {
    final hasCurrentUser = await JwtStorage.hasCurrentUser();
    if (hasCurrentUser) {
      viewModel.routerService.replaceWithHomeView();
    }

    syncFormWithViewModel(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
