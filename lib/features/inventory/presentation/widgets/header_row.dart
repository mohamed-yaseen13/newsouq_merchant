import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';
import 'package:newsouq_merchant/core/widgets/app_text_form_field.dart';

class HeaderRow extends StatefulWidget {
  final double containerWidth;

  const HeaderRow({super.key, required this.containerWidth});

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(
            'Inventory Items',
            style: AppTextStyles.black6ColorParagraph1Medium,
          ),
          horizontalSpace(widget.containerWidth * 0.3),
          AppTextFormField(
            controller: _searchController,
            placeholder: 'Search',
            prefixIcon: Image.asset('assets/icons/search.png'),
            width: 250,
          ),
          horizontalSpace(8),
          AppButton(
            desc: 'Filter',
            onPressed: () {},
            descStyle: AppTextStyles.black5ColorParagraph2Regular,
            backgroundColor: Colors.white,
            borderRadius: 8,
            prefixIconPath: 'assets/icons/filter.svg',
            isprefixIcon: true,
            height: 42,
            minWidth: 24,
            borderColor: AppColors.black,
          ),
          horizontalSpace(8),
          AppButton(
            desc: 'Bulk Action',
            onPressed: () {},
            descStyle: AppTextStyles.black5ColorParagraph2Regular,
            backgroundColor: Colors.white,
            borderRadius: 8,
            height: 42,
            minWidth: 24,
            borderColor: AppColors.black,
            isSuffixIcon: true,
            suffixIconPath: 'assets/icons/chevron-down.svg',
          ),
        ],
      ),
    );
  }
}
