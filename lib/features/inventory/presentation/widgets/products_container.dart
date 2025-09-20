import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class ProductsContainer extends StatelessWidget {
  final bool isWide;

  const ProductsContainer({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isWide ? 6 : 0),
      child: Container(
        height: 145,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/inventory_icon.svg'),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All Products',
                        style: AppTextStyles.whiteColorParagraph2Regular,
                      ),
                      Text(
                        '350',
                        style: AppTextStyles.whiteColorSubHeading3Medium,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active',
                        style: AppTextStyles.whiteColorParagraph2Regular,
                      ),
                      Row(
                        children: [
                          Text(
                            '316',
                            style: AppTextStyles.whiteColorSubHeading3Medium,
                          ),
                          horizontalSpace(8),
                          Text(
                            '86%',
                            style: AppTextStyles.white1ColorLabel1Regular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
