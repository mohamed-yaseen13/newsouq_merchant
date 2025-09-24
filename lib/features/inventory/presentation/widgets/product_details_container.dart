import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/category_dropdown.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/category_text_form_field.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/cost_price_text_form_field.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/description_text_form_field.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/discount_row.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/discount_switch_row.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/product_name_text_form_field.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/quantity_text_form_field.dart';

class ProductDetailsContainer extends StatefulWidget {
  final bool isWide;
  final TextEditingController productNameController;
  final TextEditingController sellingPriceController;
  final TextEditingController costPriceController;
  final TextEditingController quantityController;
  final TextEditingController discountController;
  final TextEditingController descriptionController;
  final TextEditingController categoryController;
  final GlobalKey<FormState> formKey;

  const ProductDetailsContainer({
    super.key,
    required this.isWide,
    required this.categoryController,
    required this.costPriceController,
    required this.descriptionController,
    required this.discountController,
    required this.productNameController,
    required this.quantityController,
    required this.sellingPriceController,
    required this.formKey,
  });

  @override
  State<ProductDetailsContainer> createState() =>
      _ProductDetailsContainerState();
}

class _ProductDetailsContainerState extends State<ProductDetailsContainer> {
  bool _isThereADiscount = false;
  String? selectedCategory;
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();

    widget.costPriceController.addListener(_onCostOrDiscountChanged);
    widget.discountController.addListener(_onCostOrDiscountChanged);
    widget.sellingPriceController.addListener(_onSellingChanged);
  }

  void _onCostOrDiscountChanged() {
    if (_isUpdating) return;
    final cost = double.tryParse(widget.costPriceController.text) ?? 0;
    final discount = double.tryParse(widget.discountController.text) ?? 0;

    if (cost > 0 && discount >= 0) {
      _isUpdating = true;
      final sellingPrice = cost - (cost * discount / 100);
      widget.sellingPriceController.text = sellingPrice.toStringAsFixed(2);
      _isUpdating = false;
    }
  }

  void _onSellingChanged() {
    if (_isUpdating) return;
    final cost = double.tryParse(widget.costPriceController.text) ?? 0;
    final selling = double.tryParse(widget.sellingPriceController.text) ?? 0;

    if (cost > 0 && selling > 0) {
      _isUpdating = true;
      final discount = ((cost - selling) / cost) * 100;
      widget.discountController.text = discount.toStringAsFixed(2);
      _isUpdating = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: widget.isWide ? 16 : 0),
      child: Container(
        height: 680,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          child: Form(
            key: widget.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductNameTextFormField(
                    productNameController: widget.productNameController,
                  ),
                  verticalSpace(18),
                  CategoryDropdown(
                    onChanged: (value) {
                      setState(() => selectedCategory = value);
                      if (value != 'other') {
                        widget.categoryController.text = selectedCategory!;
                      }
                      if (value == 'other') {
                        widget.categoryController.text = '';
                      }
                    },
                  ),
                  if (selectedCategory == 'other')
                    CategoryTextFormField(
                      categoryController: widget.categoryController,
                    ),
                  verticalSpace(18),
                  CostPriceTextFormField(
                    costPriceController: widget.costPriceController,
                  ),
                  verticalSpace(18),
                  QuantityTextFormField(
                    quantityController: widget.quantityController,
                  ),
                  verticalSpace(18),
                  DiscountSwitchRow(
                    isThereADiscount: _isThereADiscount,
                    onChanged: (value) {
                      setState(() {
                        _isThereADiscount = !_isThereADiscount;
                      });
                    },
                  ),
                  if (_isThereADiscount)
                    DiscountRow(
                      discountController: widget.discountController,
                      sellingPriceController: widget.sellingPriceController,
                    ),
                  verticalSpace(18),
                  DescriptionTextFormField(
                    descriptionController: widget.descriptionController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
