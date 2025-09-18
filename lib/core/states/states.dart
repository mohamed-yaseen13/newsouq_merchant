import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/extension.dart';

void loadingState({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const CircularProgressIndicator(),
        ),
      );
    },
  );
}

void errorState({
  required BuildContext context,
  required String desc,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(desc),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text("OK")),
      ],
    ),
  );
}
