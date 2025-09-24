import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/widgets/app_text_form_field.dart';

class DescriptionTextFormField extends StatelessWidget {
  final TextEditingController descriptionController;

  const DescriptionTextFormField({
    super.key,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: descriptionController,
      maxLines: 7,
      placeholder: 'Description',
      validator: (value) {
        if (value == null || value.length < 10) {
          return "Description must be at least 10 Characters";
        } else {
          return null;
        }
      },
    );
  }
}
