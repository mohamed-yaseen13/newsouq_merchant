import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/widgets/app_text_form_field.dart';

class CostPriceTextFormField extends StatelessWidget {
  final TextEditingController costPriceController;

  const CostPriceTextFormField({super.key, required this.costPriceController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: costPriceController,
      placeholder: 'Cost Price',
      textInputType: TextInputType.number,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            double.tryParse(value) == null ||
            double.tryParse(value)! <= 0) {
          return "cost Price must be greater that 0.0";
        } else {
          return null;
        }
      },
    );
  }
}
