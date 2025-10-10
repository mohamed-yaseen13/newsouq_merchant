import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/orders_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/recent_orders_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/sales_container.dart';
import 'package:newsouq_merchant/features/home/presentation/widgets/summary_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.dashboard,
      appHeaderTitle: 'Dashboard',
      children: [
        Row(
          children: [
            Expanded(flex: 4, child: SalesContainer()),
            horizontalSpace(12),
            Expanded(flex: 3, child: OrdersContainer()),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(flex: 4, child: SummaryContainer()),
            horizontalSpace(12),
            Expanded(flex: 3, child: RecentOrdersContainer()),
          ],
        ),
      ],
    );
  }
}
