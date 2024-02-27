import 'package:flutter/material.dart';

import '../models/password_model.dart';

/// A provider class for the PasswordScreen.
///
/// This provider manages the state of the PasswordScreen, including the
/// current passwordModelObj
class PasswordProvider extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();

  PasswordModel passwordModelObj = PasswordModel();

  bool isShowPassword = true;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
}
