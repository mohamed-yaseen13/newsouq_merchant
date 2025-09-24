import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_text_form_field.dart';

class DiscountRow extends StatelessWidget {
  final TextEditingController discountController;
  final TextEditingController sellingPriceController;
  const DiscountRow({
    super.key,
    required this.discountController,
    required this.sellingPriceController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(18),
        SizedBox(
          width: 500,
          child: Row(
            children: [
              AppTextFormField(
                width: 220,
                controller: discountController,
                placeholder: 'Discount',
                textInputType: TextInputType.number,
              ),
              Spacer(),
              AppTextFormField(
                width: 220,
                controller: sellingPriceController,
                placeholder: 'Selling Price',
                textInputType: TextInputType.number,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
