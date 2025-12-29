import 'package:flutter/material.dart';
import 'package:weather_app/core/services/auth_service.dart';
import 'package:weather_app/core/utils/app_toast.dart';

class SignupController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> onSignupPressed(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      AppToast.showError(context, "Email and password cannot be empty");
      return;
    }

    try {
      isLoading = true;
      notifyListeners();
      await _authService.signUp(email: email, password: password);
      AppToast.showSuccess(context, "Account created successfully");
    } catch (e) {
      AppToast.showError(context, e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
