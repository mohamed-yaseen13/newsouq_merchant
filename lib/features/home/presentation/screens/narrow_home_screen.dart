import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/customers_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/orders_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/recent_orders_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/sales_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/summary_container.dart';

class NarrowHomeScreen extends StatelessWidget {
  final SidebarController sidebarController;
  final bool isNarrow;

  const NarrowHomeScreen({
    super.key,
    required this.sidebarController,
    required this.isNarrow,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(
            isNarrow: isNarrow,
            title: 'Dashboard',
            sidebarController: sidebarController,
          ),
          verticalSpace(12),
          SalesContainer(isWide: false),
          verticalSpace(16),
          CustomersContainer(isWide: false),
          verticalSpace(16),
          OrdersContainer(isWide: false),
          verticalSpace(12),
          SummaryContainer(),
          verticalSpace(16),
          RecentOrdersContainer(isWide: false),
        ],
      ),
    );
  }
}
