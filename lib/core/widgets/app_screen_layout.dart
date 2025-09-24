import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';
import 'package:newsouq_merchant/core/widgets/app_sidebar.dart';

class AppScreenLayout extends StatelessWidget {
  final SidebarPage sidebarPage;
  final List<Widget> children;
  final String appHeaderTitle;
  final String? appHeaderSubTitle;

  AppScreenLayout({
    super.key,
    required this.sidebarPage,
    required this.children,
    required this.appHeaderTitle,
    this.appHeaderSubTitle,
  });

  final SidebarController sidebarController = SidebarController();

  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: AppHeader(
                        title: appHeaderTitle,
                        sidebarController: sidebarController,
                        subTitle: appHeaderSubTitle,
                      ),
                    ),
                    verticalSpace(12),
                    ...children,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
