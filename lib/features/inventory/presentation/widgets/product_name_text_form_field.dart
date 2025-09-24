import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/widgets/app_text_form_field.dart';

class ProductNameTextFormField extends StatelessWidget {
  final TextEditingController productNameController;

  const ProductNameTextFormField({
    super.key,
    required this.productNameController,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: productNameController,
      placeholder: 'Product Name',
      validator: (value) {
        if (value == null || value.length < 3) {
          return "Name Must be at least 3 Characters";
        } else {
          return null;
        }
      },
    );
  }
}
