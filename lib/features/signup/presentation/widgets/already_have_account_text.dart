import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyles.gray4Color16FontSizeRegular,
        ),
        InkWell(
          onTap: () {
            //context.pushNamed(AppRoutes.loginScreen);
          },
          child: Text(
            'Log In',
            style: AppTextStyles.blackColor16FontSizeMediumUnderline,
          ),
        ),
      ],
    );
  }
}
