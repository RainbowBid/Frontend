import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:rainbowbid_frontend/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword'),
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
      body: ListTile(
        title: _buildRegisterPageTitle(context),
        subtitle: Column(
          children: [
            verticalSpaceMedium,
            _buildNameField(context, viewModel),
            verticalSpaceMedium,
            _buildEmailField(context, viewModel),
            verticalSpaceMedium,
            _buildPasswordField(context, viewModel),
            verticalSpaceSmall,
            _buildConfirmPasswordField(context, viewModel),
            verticalSpaceLarge,
            _buildRegisterButton(context, viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterPageTitle(BuildContext context) {
    return const Text(
      'Register',
      style: TextStyle(
        fontSize: kdTitleSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildNameField(BuildContext context, RegisterViewModel viewModel) {
    return TextFormField(
      controller: nameController,
      focusNode: nameFocusNode,
      decoration: const InputDecoration(
        hintText: 'Name',
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
      ),
    );
  }

  Widget _buildEmailField(BuildContext context, RegisterViewModel viewModel) {
    return TextFormField(
      controller: emailController,
      focusNode: emailFocusNode,
      decoration: const InputDecoration(
        hintText: 'Email',
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
      ),
    );
  }

  Widget _buildPasswordField(
      BuildContext context, RegisterViewModel viewModel) {
    return TextFormField(
      controller: passwordController,
      focusNode: passwordFocusNode,
      decoration: const InputDecoration(
        hintText: 'Password',
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
      ),
    );
  }

  Widget _buildConfirmPasswordField(
      BuildContext context, RegisterViewModel viewModel) {
    return TextFormField(
      controller: confirmPasswordController,
      focusNode: confirmPasswordFocusNode,
      decoration: const InputDecoration(
        hintText: 'Confirm Password',
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
      ),
    );
  }

  Widget _buildRegisterButton(
      BuildContext context, RegisterViewModel viewModel) {
    return ElevatedButton.icon(
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
      icon: Visibility(
        visible: viewModel.busy(ksRegisterKey),
        child: const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kcWhite),
          ),
        ),
      ),
      label: const Text('Register'),
    );
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
