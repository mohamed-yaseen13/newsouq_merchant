import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class InventoryCustomersContainer extends StatelessWidget {
  final bool isWide;

  const InventoryCustomersContainer({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isWide ? 6 : 0),
      child: Container(
        height: 145,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customers',
                        style: AppTextStyles.black3ColorParagraph2Regular,
                      ),
                      Text(
                        '23',
                        style: AppTextStyles.black6ColorSubHeading3Medium,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reviewers',
                        style: AppTextStyles.black3ColorParagraph2Regular,
                      ),
                      Text(
                        '15',
                        style: AppTextStyles.black6ColorSubHeading3Medium,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Avarage Rating',
                        style: AppTextStyles.black3ColorParagraph2Regular,
                      ),
                      Text(
                        '4.3',
                        style: AppTextStyles.black6ColorSubHeading3Medium,
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
