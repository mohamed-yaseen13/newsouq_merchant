import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/cover_image_container.dart';

class ProductImagesContainer extends StatefulWidget {
  final List<Uint8List> images;
  final ValueChanged<List<Uint8List>> onImagesChanged;

  const ProductImagesContainer({
    super.key,
    required this.images,
    required this.onImagesChanged,
  });

  @override
  State<ProductImagesContainer> createState() => _ProductImagesContainerState();
}

class _ProductImagesContainerState extends State<ProductImagesContainer> {
  late List<Uint8List> images;

  @override
  void initState() {
    super.initState();
    images = List.from(widget.images);
  }

  Future<void> pickCoverImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        if (images.isNotEmpty) {
          images[0] = result.files.single.bytes!;
        } else {
          images.add(result.files.single.bytes!);
        }
      });
      widget.onImagesChanged(images);
    }
  }

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        images.add(result.files.single.bytes!);
      });
      widget.onImagesChanged(images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        return Container(
          height: 680,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoverImageContainer(
                    containerWidth: containerWidth - 32,
                    onTap: pickCoverImage,
                    image: images.isNotEmpty ? images[0] : null,
                  ),
                  if (images.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Please upload at least one image.",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  verticalSpace(18),
                  Text(
                    'Additional Images',
                    style: AppTextStyles.black6ColorParagraph1Medium,
                  ),
                  verticalSpace(8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...images.skip(1).map((image) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            image,
                            width: (containerWidth - 48) / 2,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                      InkWell(
                        onTap: pickImage,
                        child: SvgPicture.asset(
                          'assets/images/upload_additional_image.svg',
                          width: (containerWidth - 48) / 2,
                          height: 150,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/image_placeholder.svg',
                        width: (containerWidth - 48) / 2,
                        height: 150,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
