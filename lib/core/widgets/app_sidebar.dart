import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/helpers/extension.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/sidebar_item.dart';

class AppSidebar extends StatelessWidget {
  final SidebarPage currentPage;
  final bool collapsed;
  const AppSidebar({
    super.key,
    required this.currentPage,
    required this.collapsed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      width: collapsed ? 80 : 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/logo.svg'),
                if (!collapsed) horizontalSpace(12),
                if (!collapsed)
                  Text(
                    'New Souq',
                    style: AppTextStyles.black6ColorSubHeading3Bold,
                  ),
              ],
            ),
          ),
          verticalSpace(48),
          ...SidebarPage.values.map((page) {
            final data = sidebarItems[page]!;
            final isSelected = currentPage == page;
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SidebarItem(
                title: data.title,
                isSelected: isSelected,
                assetPath: data.assetPath,
                selectedAssetPath: data.selectedAssetPath,
                onTap: () {
                  if (!isSelected) {
                    context.pushNamed(data.route);
                  }
                },
                collapsed: collapsed,
              ),
            );
          }),
        ],
      ),
    );
  }
}
