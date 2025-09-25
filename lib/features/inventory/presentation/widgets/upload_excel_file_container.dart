import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';

class UploadExcelFileContainer extends StatelessWidget {
  final VoidCallback onPickExcel;
  final String? selectedFile;

  const UploadExcelFileContainer({
    super.key,
    required this.onPickExcel,
    this.selectedFile,
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
            Image.asset('assets/icons/upload_excel_file.png'),
            verticalSpace(12),
            Text(
              'Step 1: Upload Your Excel File',
              style: AppTextStyles.black6ColorParagraph1Medium,
            ),
            verticalSpace(12),
            Text(
              'Upload the Excel file with your product data',
              style: AppTextStyles.black2ColorParagraph2Regular,
            ),
            verticalSpace(12),
            AppButton(
              desc: selectedFile == null
                  ? 'Select Excel File'
                  : 'File Selected',
              onPressed: onPickExcel,
              descStyle: AppTextStyles.whiteColorParagraph2Regular,
              isprefixIcon: true,
              prefixIconPath: 'assets/icons/upload_file.svg',
              width: 200,
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  selectedFile!.split('/').last,
                  style: AppTextStyles.black2ColorParagraph2Regular,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
