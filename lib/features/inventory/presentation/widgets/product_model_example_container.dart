import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/helpers/spacing.dart';
import 'package:newsouq_merchant/core/styles/app_colors.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';

class ProductModelExampleContainer extends StatelessWidget {
  final double rowWidth;

  const ProductModelExampleContainer({super.key, required this.rowWidth});

  @override
  Widget build(BuildContext context) {
    debugPrint('row width from example: ${rowWidth.toString()}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Example of Product Model',
          style: AppTextStyles.black6ColorParagraph1Medium,
        ),
        verticalSpace(12),
        DataTable(
          clipBehavior: Clip.hardEdge,
          border: TableBorder.all(
            color: AppColors.gray1,
            borderRadius: BorderRadius.circular(24),
          ),
          showCheckboxColumn: false,
          columnSpacing: 30,
          headingRowHeight: 100,
          headingRowColor: WidgetStateProperty.all(AppColors.containerColor),
          dataRowColor: WidgetStateProperty.all(Colors.white),
          dataRowMinHeight: 100,
          dataRowMaxHeight: 100,
          columns: [
            DataColumn(
              columnWidth: FixedColumnWidth(rowWidth * 0.18),
              label: SizedBox(
                width: rowWidth * 0.13,
                child: Text(
                  'PRODUCT NAME',
                  style: AppTextStyles.black2ColorParagraph2Regular,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DataColumn(
              columnWidth: FixedColumnWidth(rowWidth * 0.12),
              label: SizedBox(
                width: rowWidth * 0.089,
                child: Text(
                  'CATEGORY',
                  style: AppTextStyles.black2ColorParagraph2Regular,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DataColumn(
              columnWidth: FixedColumnWidth(rowWidth * 0.12),
              label: SizedBox(
                width: rowWidth * 0.089,
                child: Text(
                  'COST PRICE',
                  style: AppTextStyles.black2ColorParagraph2Regular,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DataColumn(
              columnWidth: FixedColumnWidth(rowWidth * 0.14),
              label: SizedBox(
                width: rowWidth * 0.108,
                child: Text(
                  'QUANTITY IN STOCK',
                  style: AppTextStyles.black2ColorParagraph2Regular,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DataColumn(
              columnWidth: FixedColumnWidth(rowWidth * 0.11),
              label: SizedBox(
                width: rowWidth * 0.079,
                child: Text(
                  'DISCOUNT',
                  style: AppTextStyles.black2ColorParagraph2Regular,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            DataColumn(
              columnWidth: FixedColumnWidth(rowWidth * 0.35),
              label: SizedBox(
                width: rowWidth * 0.3,
                child: Text(
                  'DESCRIPTION',
                  style: AppTextStyles.black2ColorParagraph2Regular,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Center(
                    child: Text(
                      'Wireless Bluetooth Headphones',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      'Electronics',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '29.99',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '150',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '10',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      'High-quality wireless headphones with noise cancellation',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Center(
                    child: Text(
                      'Cotton T-Shirt',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      'Clothing',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '15.99',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '200',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '0',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '100% cotton comfortable t-shirt available in multiple colors',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Center(
                    child: Text(
                      'Smartphone Case',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      'Accessories',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '12.99',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '75',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      '15',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      'Protective case for smartphones with shock absorption',
                      style: AppTextStyles.black5ColorParagraph2Regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
