import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/new_item_text_row.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/product_details_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/product_images_container.dart';

class NarrowAddProductsScreen extends StatelessWidget {
  final SidebarController sidebarController;
  final bool isNarrow;
  final TextEditingController productNameController;
  final TextEditingController sellingPriceController;
  final TextEditingController costPriceController;
  final TextEditingController quantityController;
  final TextEditingController discountController;
  final TextEditingController descriptionController;
  final TextEditingController categoryController;
  final GlobalKey<FormState> formKey;
  final List<Uint8List> images;
  final ValueChanged<List<Uint8List>> onImagesChanged;

  const NarrowAddProductsScreen({
    super.key,
    required this.isNarrow,
    required this.sidebarController,
    required this.categoryController,
    required this.costPriceController,
    required this.descriptionController,
    required this.discountController,
    required this.productNameController,
    required this.quantityController,
    required this.sellingPriceController,
    required this.formKey,
    required this.images,
    required this.onImagesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(
            isNarrow: isNarrow,
            title: 'Inventory',
            subTitle: '/  Inventory  /  New Products',
            sidebarController: sidebarController,
          ),
          verticalSpace(12),
          NewItemTextRow(
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
          verticalSpace(12),
          ProductDetailsContainer(
            isWide: false,
            productNameController: productNameController,
            sellingPriceController: sellingPriceController,
            descriptionController: descriptionController,
            discountController: discountController,
            categoryController: categoryController,
            costPriceController: costPriceController,
            quantityController: quantityController,
            formKey: formKey,
          ),
          verticalSpace(12),
          ProductImagesContainer(
            images: images,
            onImagesChanged: onImagesChanged,
          ),
        ],
      ),
    );
  }
}
