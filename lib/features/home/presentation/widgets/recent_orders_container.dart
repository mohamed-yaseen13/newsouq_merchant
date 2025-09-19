import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';

class RecentOrdersContainer extends StatelessWidget {
  final bool isWide;

  const RecentOrdersContainer({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isWide ? 4 : 0),
      child: Container(
        height: 726,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resent Orders',
                style: AppTextStyles.black6ColorParagraph1Medium,
              ),
              verticalSpace(100),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/recent_orders_icon.svg'),
                    verticalSpace(16),
                    Text(
                      'No Orders Yet',
                      style: AppTextStyles.blackColorSubHeading3Medium,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(12),
                    Text(
                      'Add products to your store and start selling to see orders here.',
                      style: AppTextStyles.black3ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(16),
                    AppButton(
                      desc: 'New Product',
                      onPressed: () {},
                      descStyle: AppTextStyles.whiteColorParagraph2Regular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
