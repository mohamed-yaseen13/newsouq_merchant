import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class DashboardHeader extends StatelessWidget {
  final bool isNarrow;
  final VoidCallback onMenuPressed;

  const DashboardHeader({
    super.key,
    required this.onMenuPressed,
    required this.isNarrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 16, bottom: 8, right: 16, left: 16),
        child: Row(
          children: [
            IgnorePointer(
              ignoring: isNarrow,
              child: InkWell(
                onTap: onMenuPressed,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gray4),
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/arrow-left-double-line.svg',
                    width: 32,
                    height: 32,
                    // ignore: deprecated_member_use
                    color: AppColors.gray4,
                  ),
                ),
              ),
            ),
            horizontalSpace(36),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Dashboard',
                        style: AppTextStyles.blackColor20FontSizeSemibold,
                      ),
                      Spacer(),
                      SvgPicture.asset('assets/icons/Notification.svg'),
                      horizontalSpace(18),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.gray4,
                        ),
                        child: Center(
                          child: Text(
                            'M',
                            style: AppTextStyles.whiteColor16FontSizeMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  SvgPicture.asset('assets/icons/Home.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
