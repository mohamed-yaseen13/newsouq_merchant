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
        backgroundColor: AppColors.black,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minimumSize: Size(350, 60),
      ),
      onPressed: onPressed,
      child: Text(desc, style: descStyle),
    );
  }
}
