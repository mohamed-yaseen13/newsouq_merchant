import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_customers_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_items_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_summary_row.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/products_container.dart';

class NarrowInventoryScreen extends StatelessWidget {
  final SidebarController sidebarController;
  final bool isNarrow;

  const NarrowInventoryScreen({
    super.key,
    required this.isNarrow,
    required this.sidebarController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(
            isNarrow: isNarrow,
            title: 'Inventory',
            subTitle: '/  Inventory',
            sidebarController: sidebarController,
          ),
          verticalSpace(12),
          InventorySummaryRow(),
          verticalSpace(16),
          ProductsContainer(isWide: false),
          verticalSpace(16),
          InventoryCustomersContainer(isWide: false),
          verticalSpace(16),
          InventoryItemsContainer(),
        ],
      ),
    );
  }
}
