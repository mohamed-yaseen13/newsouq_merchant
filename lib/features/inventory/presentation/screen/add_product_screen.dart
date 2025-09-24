import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/app_constants.dart';
import 'package:newsouq_merchant/core/widgets/app_screen_layout.dart';
import 'package:newsouq_merchant/features/inventory/presentation/screen/narrow_add_products_screen.dart';
import 'package:newsouq_merchant/features/inventory/presentation/screen/wide_add_products_screen.dart';

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
  final formKay = GlobalKey<FormState>();
  List<Uint8List> images = [];

  @override
  Widget build(BuildContext context) {
    return AppScreenLayout(
      sidebarPage: SidebarPage.inventory,
      wideBuilder: (ctx, sc) => WideAddProductsScreen(
        sidebarController: sc,
        productNameController: productNameController,
        sellingPriceController: sellingPriceController,
        categoryController: categoryController,
        costPriceController: costPriceController,
        quantityController: quantityController,
        descriptionController: descriptionController,
        discountController: discountController,
        formKey: formKay,
        images: images,
        onImagesChanged: (value) {
          setState(() {
            images
              ..clear()
              ..addAll(value);
          });
          debugPrint(images.length.toString());
        },
      ),
      narrowBuilder: (ctx, sc, narrow) => NarrowAddProductsScreen(
        isNarrow: narrow,
        sidebarController: sc,
        productNameController: productNameController,
        sellingPriceController: sellingPriceController,
        categoryController: categoryController,
        costPriceController: costPriceController,
        quantityController: quantityController,
        descriptionController: descriptionController,
        discountController: discountController,
        formKey: formKay,
        images: images,
        onImagesChanged: (value) {
          setState(() {
            images
              ..clear()
              ..addAll(value);
          });
        },
      ),
    );
  }
}
