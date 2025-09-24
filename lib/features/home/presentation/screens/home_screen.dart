import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/home/presentation/screens/narrow_home_screen.dart';
import 'package:newsouq_merchant/features/home/presentation/screens/wide_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.dashboard,
      wideBuilder: (ctx, sc) => WideHomeScreen(sidebarController: sc),
      narrowBuilder: (ctx, sc, narrow) =>
          NarrowHomeScreen(isNarrow: narrow, sidebarController: sc),
    );
  }
}
