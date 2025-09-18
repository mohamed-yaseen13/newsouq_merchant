import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class CustomersContainer extends StatelessWidget {
  final bool isWide;

  const CustomersContainer({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isWide ? 16 : 0),
      child: Container(
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
                  SvgPicture.asset('assets/icons/customers_icon.svg'),
                  Spacer(),
                  Text('This Week'),
                ],
              ),
              Spacer(),
              Text('Customers'),
              Row(
                children: [
                  Text('0', style: AppTextStyles.blackColor32FontSizeSemibold),
                  horizontalSpace(8),
                  Text(
                    '+0.00%',
                    style: AppTextStyles.greenColor12FontSizeRegular,
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
