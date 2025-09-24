import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.customers,
      appHeaderTitle: "Customers",
      appHeaderSubTitle: '/  Customers',
      children: [],
    );
  }
}
