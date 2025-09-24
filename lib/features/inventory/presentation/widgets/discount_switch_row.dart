import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class DiscountSwitchRow extends StatelessWidget {
  final Function(bool)? onChanged;
  final bool isThereADiscount;

  const DiscountSwitchRow({
    super.key,
    required this.isThereADiscount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Row(
        children: [
          Text('Discount', style: AppTextStyles.black6ColorParagraph1Medium),
          Spacer(),
          Text(
            'Add Discount',
            style: AppTextStyles.black5ColorParagraph2Regular,
          ),
          horizontalSpace(4),
          Switch(
            value: isThereADiscount,
            onChanged: onChanged,
            activeThumbColor: AppColors.blue,
            inactiveThumbColor: AppColors.gray1,
          ),
        ],
      ),
    );
  }
}
