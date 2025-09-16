import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq_merchant/core/helpers/extension.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/routing/app_routes.dart';
import 'package:newsouq_merchant/core/states/states.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq_merchant/features/login/presentation/cubit/login_state.dart';
import 'package:newsouq_merchant/features/login/presentation/widgets/dont_have_an_account_text.dart';
import 'package:newsouq_merchant/features/login/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginLoading _:
              return loadingState(context: context);
            case LoginError _:
              Navigator.of(context, rootNavigator: true).pop();
              return errorState(
                context: context,
                desc: 'Login Failed',
                message: state.apiErrorModel.message!,
              );
            case LoginSuccess _:
              Navigator.of(context, rootNavigator: true).pop();
              context.pushReplacementNamed(AppRoutes.homeScreen);
            default:
              return;
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login to your Account',
                style: AppTextStyles.blackColor32FontSizeSemibold,
              ),
              verticalSpace(4),
              Text(
                "It's great to see you again.",
                style: AppTextStyles.gray5Color16FontSizeRegular,
              ),
              verticalSpace(24),
              LoginForm(),
              verticalSpace(64),
              DontHaveAnAccountText(),
            ],
          );
        },
      ),
    );
  }
}
