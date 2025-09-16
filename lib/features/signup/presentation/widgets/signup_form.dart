import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';
import 'package:newsouq_merchant/core/widgets/email_text_form_field.dart';
import 'package:newsouq_merchant/core/widgets/password_text_form_field.dart';
import 'package:newsouq_merchant/core/widgets/username_text_form_field.dart';
import 'package:newsouq_merchant/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:newsouq_merchant/features/signup/presentation/widgets/terms_and_condition_text.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UsernameTextFormField(nameController: _nameController),
          verticalSpace(16),
          EmailTextFormField(emailController: _emailController),
          verticalSpace(16),
          PasswordTextFormField(passwordController: _passwordController),
          verticalSpace(16),
          TermsAndConditionText(),
          verticalSpace(48),
          Center(
            child: AppButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SignupCubit>().signup(
                    _emailController.text,
                    _passwordController.text,
                  );
                }
              },
              desc: 'Create an Account',
              descStyle: AppTextStyles.whiteColor16FontSizeMedium,
            ),
          ),
        ],
      ),
    );
  }
}
