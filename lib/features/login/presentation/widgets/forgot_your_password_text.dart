import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class ForgotYourPasswordText extends StatelessWidget {
  const ForgotYourPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Forgot your password? ",
          style: AppTextStyles.black2ColorParagraph2Regular,
        ),
        InkWell(
          onTap: () {
            //context.pushNamed(AppRoutes.forgotPasswordScreen);
          },
          child: Text(
            'Reset Your Password',
            style: AppTextStyles.blue2ColorParagraph2Regular,
          ),
        ),
      ],
    );
  }
}
