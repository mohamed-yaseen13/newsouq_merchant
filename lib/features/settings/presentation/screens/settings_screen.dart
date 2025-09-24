import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/settings/presentation/screens/narrow_settings_screen.dart';
import 'package:newsouq_merchant/features/settings/presentation/screens/wide_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.settings,
      wideBuilder: (ctx, sc) => WideSettingsScreen(sidebarController: sc),
      narrowBuilder: (ctx, sc, narrow) =>
          NarrowSettingsScreen(isNarrow: narrow, sidebarController: sc),
    );
  }
}
