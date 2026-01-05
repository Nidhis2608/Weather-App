import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_texts_fields.dart';
import '../auth_controller/signup_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupController(),
      child: Consumer<SignupController>(
        builder: (context, controller, _) {
          return Scaffold(
            body: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 420),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        AppTexts.signup,
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

                      SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.isLoading
                              ? null
                              : () => controller.onSignupPressed(context),
                          child: controller.isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(AppTexts.signup),
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
