import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq_merchant/core/helpers/extension.dart';
import 'package:newsouq_merchant/core/routing/app_routes.dart';
import 'package:newsouq_merchant/core/states/states.dart';
import 'package:newsouq_merchant/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:newsouq_merchant/features/signup/presentation/cubit/signup_state.dart';
import 'package:newsouq_merchant/features/signup/presentation/widgets/signup_builder.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          switch (state) {
            case SignupLoading _:
              return loadingState(context: context);

            case SignupError _:
              Navigator.of(context, rootNavigator: true).pop();
              return errorState(
                context: context,
                desc: 'Signup Failed',
                message: state.apiErrorModel.message!,
              );

            case SignupSuccess _:
              Navigator.of(context, rootNavigator: true).pop();
              context.pushReplacementNamed(AppRoutes.homeScreen);

            default:
              return;
          }
        },
        builder: (context, state) {
          return SignupBuilder();
        },
      ),
    );
  }
}
