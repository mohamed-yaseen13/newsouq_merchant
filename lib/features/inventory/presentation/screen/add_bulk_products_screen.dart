import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/inventory/presentation/cubit/add_product_cubit.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/product_model_example_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/upload_excel_file_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/upload_images_folder_container.dart';
import 'package:newsouq_merchant/features/inventory/services/group_images.dart';
import 'package:newsouq_merchant/features/inventory/services/parse_excel_file.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:js_util' as js_util;

class AddBulkProductsScreen extends StatefulWidget {
  const AddBulkProductsScreen({super.key});

  @override
  State<AddBulkProductsScreen> createState() => _AddBulkProductsScreenState();
}

class _AddBulkProductsScreenState extends State<AddBulkProductsScreen> {
  List<html.File>? pickedFiles;
  String? imagesFolderPath;
  Uint8List? excelFileBytes;

  void _pickExcelFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() => excelFileBytes = result.files.first.bytes);
    }
  }

  void _pickImagesFolder() {
    final uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.setAttribute("webkitdirectory", "");

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      if (files != null) {
        pickedFiles = files.toList();

        final Map<String, List<String>> tempGrouped = {};

        debugPrint("📂 Picked ${pickedFiles!.length} files");

        for (final file in pickedFiles!) {
          final relativePath = js_util.getProperty<String>(
            file,
            'webkitRelativePath',
          );
          debugPrint("🔎 Full path: $relativePath");

          final folderName = (relativePath.isNotEmpty)
              ? relativePath.split('/').length > 1
                    ? relativePath.split('/')[1]
                    : 'UNKNOWN_FOLDER'
              : 'UNKNOWN_FOLDER';

          tempGrouped.putIfAbsent(folderName, () => []);
          tempGrouped[folderName]!.add(file.name);
        }

        tempGrouped.forEach((folder, files) {
          debugPrint("🔸 Product Folder: $folder");
          for (final f in files) {
            debugPrint("    - $f");
          }
        });

        setState(() {
          imagesFolderPath = "Selected ${pickedFiles!.length} images";
        });
      }
    });

    uploadInput.click();
  }

  bool get isReadyToUpload =>
      excelFileBytes != null && imagesFolderPath != null;

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.inventory,
      appHeaderTitle: "Inventory",
      appHeaderSubTitle: '/  Inventory  /  New Products',
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final rowWidth = constraints.maxWidth;
            return Row(
              children: [
                Expanded(
                  child: ProductModelExampleContainer(rowWidth: rowWidth),
                ),
              ],
            );
          },
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: UploadExcelFileContainer(
                onPickExcel: _pickExcelFile,
                selectedFile: excelFileBytes != null
                    ? "Excel file selected"
                    : null,
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              child: UploadImagesFolderContainer(
                onPickFolder: _pickImagesFolder,
                selectedFolder: imagesFolderPath,
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Spacer(),
            IgnorePointer(
              ignoring: !isReadyToUpload,
              child: AppButton(
                desc: 'Process & Upload',
                onPressed: () async {
                  final imageGroups = await GroupImages.groupImagesByProduct(
                    pickedFiles!,
                  );

                  final products = await ParseExcelFile.parse(
                    excelFileBytes!,
                    imageGroups,
                  );
                  for (final product in products) {
                    // ignore: use_build_context_synchronously
                    context.read<AddProductCubit>().addProduct(product);
                  }
                },
                descStyle: AppTextStyles.whiteColorParagraph2Regular,
                width: 160,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
