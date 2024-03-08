import 'package:rainbowbid_frontend/ui/common/app_constants.dart';

abstract class UserValidator {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }

    if (name.length < kiMinUsernameLength ||
        name.length > kiMaxUsernameLength) {
      return 'Name must be between $kiMinUsernameLength and $kiMaxUsernameLength characters';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(krEmailPattern).hasMatch(email)) {
      return 'Invalid email format';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (!RegExp(krPasswordPattern).hasMatch(password)) {
      return 'Password must contain at least one uppercase letter, '
          'one lowercase letter, one number, one special character '
          'and be at least 6 characters long';
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    return null;
  }
}
