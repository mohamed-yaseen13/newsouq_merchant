import 'package:flutter/material.dart';

class SidebarController {
  final ValueNotifier<bool> isCollapsed = ValueNotifier(false);

  void toggle() {
    isCollapsed.value = !isCollapsed.value;
  }
}
