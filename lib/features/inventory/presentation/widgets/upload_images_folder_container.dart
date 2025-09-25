import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';

class UploadImagesFolderContainer extends StatelessWidget {
  final VoidCallback onPickFolder;
  final String? selectedFolder;

  const UploadImagesFolderContainer({
    super.key,
    required this.onPickFolder,
    this.selectedFolder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        border: Border.all(color: AppColors.gray1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/folder.png'),
            verticalSpace(12),
            Text(
              'Step 3: Upload Product Images',
              style: AppTextStyles.black6ColorParagraph1Medium,
            ),
            verticalSpace(12),
            Text(
              'Select images folder contains folders named exactly as your products',
              style: AppTextStyles.black2ColorParagraph2Regular,
            ),
            verticalSpace(12),
            AppButton(
              desc: selectedFolder == null
                  ? 'Select Images Folder'
                  : 'Folder Selected',
              onPressed: onPickFolder,
              descStyle: AppTextStyles.whiteColorParagraph2Regular,
              isprefixIcon: true,
              prefixIconPath: 'assets/icons/folder.svg',
              width: 230,
            ),
            if (selectedFolder != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  selectedFolder!.split('/').last,
                  style: AppTextStyles.black2ColorParagraph2Regular,
                ),
              ),
            verticalSpace(12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.gray1,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/warning.svg'),
                      horizontalSpace(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/dot.svg'),
                              horizontalSpace(12),
                              Text(
                                'Create a folder for each product named exactly as in your Excel file',
                                style:
                                    AppTextStyles.blue2ColorParagraph2Regular,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/dot.svg'),
                              horizontalSpace(12),
                              Text(
                                'Place all images for a product inside its corresponding folder',
                                style:
                                    AppTextStyles.blue2ColorParagraph2Regular,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/dot.svg'),
                              horizontalSpace(12),
                              Text(
                                'Supported formats: JPG, PNG, GIF',
                                style:
                                    AppTextStyles.blue2ColorParagraph2Regular,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/dot.svg'),
                              horizontalSpace(12),
                              Text(
                                'Example: "Wireless Bluetooth Headphones" folder contains images of this product',
                                style:
                                    AppTextStyles.blue2ColorParagraph2Regular,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
