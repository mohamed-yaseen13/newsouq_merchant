import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';

class InventorySummaryRow extends StatelessWidget {
  const InventorySummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Inventory Summary',
          style: AppTextStyles.black6ColorParagraph1Medium,
        ),
        Spacer(),
        AppButton(
          desc: 'Add Products',
          onPressed: () {},
          descStyle: AppTextStyles.whiteColorParagraph2Regular,
        ),
      ],
    );
  }
}
