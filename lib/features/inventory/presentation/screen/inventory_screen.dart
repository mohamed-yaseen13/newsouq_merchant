import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_customers_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_items_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/inventory_summary_row.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/products_container.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.inventory,
      appHeaderTitle: "Inventory",
      appHeaderSubTitle: '/  Inventory',
      children: [
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
    );
  }
}
