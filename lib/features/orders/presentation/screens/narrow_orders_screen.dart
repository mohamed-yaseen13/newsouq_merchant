import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';

class NarrowOrdersScreen extends StatelessWidget {
  final SidebarController sidebarController;
  final bool isNarrow;

  const NarrowOrdersScreen({
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
            title: 'Orders',
            subTitle: '/  Orders',
            sidebarController: sidebarController,
          ),
        ],
      ),
    );
  }
}
