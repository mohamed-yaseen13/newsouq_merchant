import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/chat/presentation/screens/narrow_chat_screen.dart';
import 'package:newsouq_merchant/features/chat/presentation/screens/wide_chat_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.conversations,
      title: 'Conversation',
      wideBuilder: (ctx, sc) => WideChatScreen(sidebarController: sc),
      narrowBuilder: (ctx, sc, narrow) =>
          NarrowChatScreen(isNarrow: narrow, sidebarController: sc),
    );
  }
}
