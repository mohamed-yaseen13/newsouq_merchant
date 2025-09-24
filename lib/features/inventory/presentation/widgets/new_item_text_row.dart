import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';
import 'package:newsouq_merchant/features/inventory/data/models/add_product_request_model.dart';
import 'package:newsouq_merchant/features/inventory/presentation/cubit/add_product_cubit.dart';

class NewItemTextRow extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController productNameController;
  final TextEditingController sellingPriceController;
  final TextEditingController costPriceController;
  final TextEditingController quantityController;
  final TextEditingController discountController;
  final TextEditingController descriptionController;
  final TextEditingController categoryController;
  final List<Uint8List> images;

  const NewItemTextRow({
    super.key,
    required this.formKey,
    required this.categoryController,
    required this.costPriceController,
    required this.descriptionController,
    required this.discountController,
    required this.productNameController,
    required this.quantityController,
    required this.sellingPriceController,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final rowWidth = constraints.maxWidth;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                'New Inventory Item',
                style: AppTextStyles.black6ColorParagraph1Medium,
              ),
              horizontalSpace(rowWidth * 0.5 - 4),
              AppButton(
                backgroundColor: AppColors.black10,
                desc: 'Save as Draft',
                onPressed: () {},
                descStyle: AppTextStyles.whiteColorParagraph2Regular,
              ),
              horizontalSpace(12),
              AppButton(
                backgroundColor: AppColors.blue,
                desc: 'Save & Publish',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint('Good');
                    final addProductRequestModel = AddProductRequestModel(
                      name: productNameController.text,
                      category: categoryController.text,
                      costPrice: double.parse(costPriceController.text),
                      quantity: int.parse(quantityController.text),
                      discount: double.parse(discountController.text),
                      sellingPrice: double.parse(sellingPriceController.text),
                      description: descriptionController.text,
                      images: images,
                    );
                    context.read<AddProductCubit>().addProduct(
                      addProductRequestModel,
                    );
                  }
                },
                descStyle: AppTextStyles.whiteColorParagraph2Regular,
              ),
            ],
          ),
        );
      },
    );
  }
}
