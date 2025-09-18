import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/orders/presentation/screens/narrow_orders_screen.dart';
import 'package:newsouq_merchant/features/orders/presentation/screens/wide_orders_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      narrowBuilder: (ctx, sc, narrow) =>
          NarrowOrdersScreen(isNarrow: narrow, sidebarController: sc),
      sidebarPage: SidebarPage.orders,
      title: "Orders",
      wideBuilder: (ctx, sc) => WideOrdersScreen(sidebarController: sc),
    );
  }
}
