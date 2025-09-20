import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/customers/presentation/screens/narrow_customers_screen.dart';
import 'package:newsouq_merchant/features/customers/presentation/screens/wide_customers_screen.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.customers,
      title: 'Customers',
      wideBuilder: (ctx, sc) => WideCustomersScreen(sidebarController: sc),
      narrowBuilder: (ctx, sc, narrow) =>
          NarrowCustomersScreen(isNarrow: narrow, sidebarController: sc),
    );
  }
}
