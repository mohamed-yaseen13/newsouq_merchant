import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/widgets/app_text_form_field.dart';

class QuantityTextFormField extends StatelessWidget {
  final TextEditingController quantityController;

  const QuantityTextFormField({super.key, required this.quantityController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: quantityController,
      placeholder: 'Quantity in Stock',
      textInputType: TextInputType.number,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            int.tryParse(value) == null ||
            int.tryParse(value)! <= 0) {
          return "Quantity must be at least 1 unit";
        } else {
          return null;
        }
      },
    );
  }
}
