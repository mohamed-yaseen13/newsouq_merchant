import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class AppHeader extends StatefulWidget {
  final bool isNarrow;
  final String title;
  final SidebarController sidebarController;

  const AppHeader({
    super.key,
    required this.isNarrow,
    required this.title,
    required this.sidebarController,
  });

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
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
              ignoring: widget.isNarrow,
              child: InkWell(
                onTap: () {
                  setState(() {});
                  widget.sidebarController.toggle();
                },
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gray4),
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    widget.sidebarController.isCollapsed.value
                        ? 'assets/icons/arrow-right-double-line.svg'
                        : 'assets/icons/arrow-left-double-line.svg',
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
                        widget.title,
                        style: AppTextStyles.black6ColorSubHeading3Medium,
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
                            style: AppTextStyles.whiteColor20FontSizeRegular,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/Home.svg'),
                      horizontalSpace(16),
                      Text(
                        '/   ${widget.title}',
                        style: AppTextStyles.black3ColorLabel1Regular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
