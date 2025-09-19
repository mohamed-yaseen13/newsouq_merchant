import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';

class AppButton extends StatelessWidget {
  final String desc;
  final VoidCallback onPressed;
  final TextStyle descStyle;

  const AppButton({
    super.key,
    required this.desc,
    required this.onPressed,
    required this.descStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(180, 58),
      ),
      onPressed: onPressed,
      child: Text(desc, style: descStyle),
    );
  }
}
