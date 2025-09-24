import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class CoverImageContainer extends StatelessWidget {
  final double containerWidth;
  final Function()? onTap;
  final Uint8List? image;

  const CoverImageContainer({
    super.key,
    required this.containerWidth,
    required this.onTap,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 300,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.background,
        ),
        child: image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.memory(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/image.svg'),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/upload.svg'),
                      horizontalSpace(4),
                      Text(
                        'Upload Image',
                        style: AppTextStyles.blue2ColorParagraph2Regular,
                      ),
                    ],
                  ),
                  verticalSpace(12),
                  Text(
                    'Upload a cover image for your product.',
                    style: AppTextStyles.black3ColorParagraph2Regular,
                  ),
                ],
              ),
      ),
    );
  }
}
