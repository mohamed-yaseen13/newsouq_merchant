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
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                controller: discountController,
                placeholder: 'Discount',
                textInputType: TextInputType.number,
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: AppTextFormField(
                controller: sellingPriceController,
                placeholder: 'Selling Price',
                textInputType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
