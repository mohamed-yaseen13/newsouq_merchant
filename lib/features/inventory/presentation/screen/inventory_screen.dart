import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/inventory/presentation/screen/narrow_inventory_screen.dart';
import 'package:newsouq_merchant/features/inventory/presentation/screen/wide_inventory_screen.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      narrowBuilder: (ctx, sc, narrow) =>
          NarrowInventoryScreen(isNarrow: narrow, sidebarController: sc),
      sidebarPage: SidebarPage.inventory,
      title: 'Inventory',
      wideBuilder: (ctx, sc) => WideInventoryScreen(sidebarController: sc),
    );
  }
}
