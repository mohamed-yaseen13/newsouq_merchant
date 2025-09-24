import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';

class NarrowCustomersScreen extends StatelessWidget {
  final SidebarController sidebarController;
  final bool isNarrow;

  const NarrowCustomersScreen({
    super.key,
    required this.isNarrow,
    required this.sidebarController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppHeader(
            isNarrow: isNarrow,
            title: 'Customers',
            subTitle: '/  Customers',
            sidebarController: sidebarController,
          ),
        ],
      ),
    );
  }
}
