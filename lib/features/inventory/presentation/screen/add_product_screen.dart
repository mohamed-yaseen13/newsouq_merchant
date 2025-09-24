import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/new_item_text_row.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/product_details_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/product_images_container.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final productNameController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final costPriceController = TextEditingController();
  final quantityController = TextEditingController();
  final discountController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Uint8List> images = [];

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.inventory,
      appHeaderTitle: "Inventory",
      appHeaderSubTitle: '/  Inventory  /  New Products',
      children: [
        Row(
          children: [
            Expanded(
              child: NewItemTextRow(
                formKey: formKey,
                productNameController: productNameController,
                categoryController: categoryController,
                costPriceController: costPriceController,
                descriptionController: descriptionController,
                discountController: discountController,
                quantityController: quantityController,
                sellingPriceController: sellingPriceController,
                images: images,
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: ProductDetailsContainer(
                isWide: true,
                productNameController: productNameController,
                sellingPriceController: sellingPriceController,
                descriptionController: descriptionController,
                discountController: discountController,
                categoryController: categoryController,
                costPriceController: costPriceController,
                quantityController: quantityController,
                formKey: formKey,
              ),
            ),
            Expanded(
              flex: 2,
              child: ProductImagesContainer(
                images: images,
                onImagesChanged: (value) {
                  setState(() {
                    images.add(value.last);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
