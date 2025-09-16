import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/extension.dart';
import 'package:newsouq_merchant/core/routing/app_routes.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: AppTextStyles.gray4Color16FontSizeRegular,
        ),
        InkWell(
          onTap: () {
            context.pushNamed(AppRoutes.signupScreen);
          },
          child: Text(
            'Signup',
            style: AppTextStyles.blackColor16FontSizeMediumUnderline,
          ),
        ),
      ],
    );
  }
}
