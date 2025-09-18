import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/customers_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/orders_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/recent_orders_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/sales_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/summary_container.dart';

class WideHomeScreen extends StatelessWidget {
  final SidebarController sidebarController;

  const WideHomeScreen({super.key, required this.sidebarController});

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
              title: "Dashboard",
              sidebarController: sidebarController,
            ),
          ),
          verticalSpace(12),
          Row(
            children: [
              Expanded(flex: 2, child: SalesContainer(isWide: true)),
              Expanded(flex: 2, child: CustomersContainer(isWide: true)),
              Expanded(flex: 3, child: OrdersContainer(isWide: true)),
            ],
          ),
          verticalSpace(12),
          Row(
            children: [
              Expanded(flex: 4, child: SummaryContainer()),
              horizontalSpace(32),
              Expanded(flex: 3, child: RecentOrdersContainer(isWide: true)),
            ],
          ),
        ],
      ),
    );
  }
}
