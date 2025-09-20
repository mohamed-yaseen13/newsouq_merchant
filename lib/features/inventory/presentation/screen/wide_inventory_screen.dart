import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_customers_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_items_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_summary_row.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/products_container.dart';

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
          verticalSpace(12),
          Row(children: [Expanded(child: InventorySummaryRow())]),
          verticalSpace(12),
          Row(
            children: [
              Expanded(child: ProductsContainer(isWide: true)),
              Expanded(child: InventoryCustomersContainer(isWide: true)),
            ],
          ),
          verticalSpace(12),
          Row(children: [Expanded(child: InventoryItemsContainer())]),
        ],
      ),
    );
  }
}
