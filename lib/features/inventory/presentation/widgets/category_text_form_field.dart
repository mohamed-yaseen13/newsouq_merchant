import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_text_form_field.dart';

class CategoryTextFormField extends StatelessWidget {
  final TextEditingController categoryController;

  const CategoryTextFormField({super.key, required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(18),
        AppTextFormField(
          controller: categoryController,
          placeholder: "Enter Product's Category",
          validator: (value) {
            if (value == null || value.length < 3) {
              return "Category Must be at least 3 Characters";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
