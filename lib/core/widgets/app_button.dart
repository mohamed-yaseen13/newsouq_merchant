import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';

class AppButton extends StatelessWidget {
  final String desc;
  final VoidCallback onPressed;
  final TextStyle descStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? minWidth;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Color? borderColor;
  final bool isprefixIcon;
  final bool isSuffixIcon;

  const AppButton({
    super.key,
    required this.desc,
    required this.onPressed,
    required this.descStyle,
    this.backgroundColor,
    this.borderRadius,
    this.height,
    this.width,
    this.prefixIconPath,
    this.borderColor,
    this.isprefixIcon = false,
    this.isSuffixIcon = false,
    this.suffixIconPath,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
          minimumSize: Size(minWidth ?? 180, height ?? 58),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isprefixIcon) SvgPicture.asset(prefixIconPath!),
            if (isprefixIcon) horizontalSpace(18),
            Text(desc, style: descStyle),
            if (isSuffixIcon) horizontalSpace(18),
            if (isSuffixIcon) SvgPicture.asset(suffixIconPath!),
          ],
        ),
      ),
    );
  }
}
