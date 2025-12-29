import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/widgets/app_texts_fields.dart';

import '../../../core/constants/app_texts.dart';
import '../../../core/theme/app_text_styles.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: Consumer<LoginController>(
        builder: (context, controller, _) {
          return Scaffold(
            body: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 420),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),

                      Text(
                        AppTexts.login,
                        style: AppTextStyles.headline(context),
                      ),

                      SizedBox(height: 32),

                      AppTextsField(
                        label: AppTexts.email,
                        controller: controller.emailController,
                      ),

                      SizedBox(height: 16),

                      AppTextsField(
                        label: AppTexts.password,
                        obscureText: true,
                        controller: controller.passwordController,
                      ),

                      SizedBox(height: 8),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(AppTexts.forgetPassword),
                        ),
                      ),

                      SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.isLoading
                                ? null
                                : controller.onLoginPressed(context);
                          },
                          child: controller.isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(AppTexts.login),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
