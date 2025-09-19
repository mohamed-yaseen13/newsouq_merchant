import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/features/signup/presentation/widgets/already_have_account_text.dart';
import 'package:newsouq_merchant/features/signup/presentation/widgets/signup_form.dart';

class SignupBuilder extends StatelessWidget {
  const SignupBuilder({super.key});

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started With ',
                      style: AppTextStyles.blackColorSubHeading3Medium,
                    ),
                    Text(
                      'New Souq',
                      style: AppTextStyles.blueColorSubHeading3Medium,
                    ),
                  ],
                ),
                verticalSpace(4),
                Text(
                  "create your free account.",
                  style: AppTextStyles.black3ColorParagraph2Regular,
                ),
                verticalSpace(24),
                SignupForm(),
                verticalSpace(32),
                AlreadyHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
