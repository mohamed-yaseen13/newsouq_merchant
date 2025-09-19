import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/features/login/presentation/widgets/dont_have_an_account_text.dart';
import 'package:newsouq_merchant/features/login/presentation/widgets/login_form.dart';

class LoginBuilder extends StatelessWidget {
  const LoginBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Center(
          child: Container(
            width: 443,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/icons/logo.svg'),
                verticalSpace(18),
                Text(
                  'Welcome Back',
                  style: AppTextStyles.blackColorSubHeading3Medium,
                ),
                verticalSpace(8),
                Text(
                  'Login to your account',
                  style: AppTextStyles.black3ColorParagraph2Regular,
                ),
                verticalSpace(24),
                LoginForm(),
                verticalSpace(32),
                DontHaveAnAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
