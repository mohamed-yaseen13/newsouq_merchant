import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';

class WideInventoryScreen extends StatelessWidget {
  final SidebarController sidebarController;

  const WideInventoryScreen({super.key, required this.sidebarController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: AppHeader(
              isNarrow: false,
              title: "Inventory",
              sidebarController: sidebarController,
            ),
          ),
        ],
      ),
    );
  }
}
