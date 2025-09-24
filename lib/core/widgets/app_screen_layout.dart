import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_sidebar.dart';

class AppScreenLayout extends StatelessWidget {
  final SidebarPage sidebarPage;
  final Widget Function(BuildContext, SidebarController) wideBuilder;
  final Widget Function(BuildContext, SidebarController, bool isNarrow)
  narrowBuilder;

  AppScreenLayout({
    super.key,
    required this.sidebarPage,
    required this.wideBuilder,
    required this.narrowBuilder,
  });

  final SidebarController sidebarController = SidebarController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWide = screenWidth > 900;
    final bool isNarrow = screenWidth < 600;

    if (!isWide) {
      sidebarController.isCollapsed.value = true;
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: sidebarController.isCollapsed,
              builder: (context, collapsed, _) {
                return AppSidebar(
                  collapsed: collapsed,
                  currentPage: sidebarPage,
                );
              },
            ),
            horizontalSpace(12),
            Expanded(
              child: isWide
                  ? wideBuilder(context, sidebarController)
                  : narrowBuilder(context, sidebarController, isNarrow),
            ),
          ],
        ),
      ),
    );
  }
}
