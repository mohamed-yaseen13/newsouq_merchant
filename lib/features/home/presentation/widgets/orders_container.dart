import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class OrdersContainer extends StatelessWidget {
  const OrdersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/orders_icon.svg'),
                Spacer(),
                Text('Orders'),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'This Week',
                      style: AppTextStyles.black3ColorParagraph2Regular,
                    ),
                    verticalSpace(4),
                    Text(
                      '0.00',
                      style: AppTextStyles.black6ColorSubHeading3Medium,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Last Week',
                      style: AppTextStyles.black3ColorParagraph2Regular,
                    ),
                    verticalSpace(4),
                    Text(
                      '0.00',
                      style: AppTextStyles.black6ColorSubHeading3Medium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
