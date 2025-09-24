import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/controllers/sidebar_controller.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/widgets/app_header.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/new_item_text_row.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/product_details_container.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/product_images_container.dart';

class WideAddProductsScreen extends StatelessWidget {
  final SidebarController sidebarController;
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

  const WideAddProductsScreen({
    super.key,
    required this.sidebarController,
    required this.productNameController,
    required this.categoryController,
    required this.costPriceController,
    required this.descriptionController,
    required this.discountController,
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
          SizedBox(
            height: 100,
            child: AppHeader(
              isNarrow: false,
              title: "Inventory",
              subTitle: '/  Inventory  /  New Products',
              sidebarController: sidebarController,
            ),
          ),
          verticalSpace(12),
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
                  onImagesChanged: onImagesChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
