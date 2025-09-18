import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/routing/app_routes.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class SidebarItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String assetPath;
  final String selectedAssetPath;
  final VoidCallback onTap;
  final bool collapsed;

  const SidebarItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.assetPath,
    required this.selectedAssetPath,
    required this.onTap,
    required this.collapsed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              horizontalSpace(8),
              SvgPicture.asset(isSelected ? selectedAssetPath : assetPath),
              horizontalSpace(18),
              if (!collapsed)
                Text(
                  title,
                  style: isSelected
                      ? AppTextStyles.whiteColor16FontSizeMedium
                      : AppTextStyles.gray5Color16FontSizeRegular,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarItemData {
  final String title;
  final String route;
  final String assetPath;
  final String selectedAssetPath;

  const SidebarItemData({
    required this.title,
    required this.route,
    required this.assetPath,
    required this.selectedAssetPath,
  });
}

const sidebarItems = {
  SidebarPage.dashboard: SidebarItemData(
    title: 'Dashboard',
    route: AppRoutes.homeScreen,
    assetPath: 'assets/icons/dashboard.svg',
    selectedAssetPath: 'assets/icons/selected_dashboard.svg',
  ),
  SidebarPage.orders: SidebarItemData(
    title: 'Orders',
    route: AppRoutes.ordersScreen,
    assetPath: 'assets/icons/bag.svg',
    selectedAssetPath: 'assets/icons/selected_bag.svg',
  ),
  SidebarPage.customers: SidebarItemData(
    title: "Customers",
    route: AppRoutes.customersScreen,
    assetPath: 'assets/icons/customers.svg',
    selectedAssetPath: 'assets/icons/selected_customers.svg',
  ),
  SidebarPage.inventory: SidebarItemData(
    title: "Inventory",
    route: AppRoutes.inventoryScreen,
    assetPath: 'assets/icons/inventory.svg',
    selectedAssetPath: 'assets/icons/selected_inventory.svg',
  ),
  SidebarPage.conversations: SidebarItemData(
    title: "Conversation",
    route: AppRoutes.chatScreen,
    assetPath: 'assets/icons/chat.svg',
    selectedAssetPath: 'assets/icons/selected_chat.svg',
  ),
  SidebarPage.settings: SidebarItemData(
    title: 'Settings',
    route: AppRoutes.settingsScreen,
    assetPath: 'assets/icons/settings.svg',
    selectedAssetPath: 'assets/icons/selected_settings.svg',
  ),
};
