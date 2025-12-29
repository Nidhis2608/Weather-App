import 'package:flutter/material.dart';
import 'package:weather_app/core/services/auth_service.dart';
import 'package:weather_app/core/utils/app_toast.dart';

import '../../../core/env_config.dart';

class LoginController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> onLoginPressed(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      AppToast.showError(context, "Email and password cannot be empty");
    }
    try {
      isLoading = true;
      notifyListeners();
      await _authService.signIn(email: email, password: password);
      AppToast.showSuccess(context, "Login successful");
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print(EnvConfig.weatherApiKey);
    } catch (e) {
      AppToast.showError(context, e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
