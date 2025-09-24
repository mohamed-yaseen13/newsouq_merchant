import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/styles/app_text_styles.dart';
import 'package:newsouq_merchant/core/widgets/app_button.dart';
import 'package:newsouq_merchant/features/inventory/presentation/widgets/header_row.dart';

class InventoryItemsContainer extends StatelessWidget {
  const InventoryItemsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        return Container(
          height: 726,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderRow(containerWidth: containerWidth),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: DataTable(
                        showCheckboxColumn: true,
                        columnSpacing: 28,
                        headingRowColor: WidgetStateProperty.all(Colors.white),
                        columns: const [
                          DataColumn(label: Text('Product Name')),
                          DataColumn(label: Text('Category')),
                          DataColumn(label: Text('Unit Price')),
                          DataColumn(label: Text('In-Stock')),
                          DataColumn(label: Text('Discount')),
                          DataColumn(label: Text('Total Value')),
                          DataColumn(label: Text('Action')),
                          DataColumn(label: Text('Status')),
                        ],
                        rows: _inventoryRows,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final List<DataRow> _inventoryRows = [
  DataRow(
    selected: false, // ✅ initial state
    onSelectChanged: (selectedt) {
      // ✅ handle checkbox selection
      debugPrint('Row selected: $selectedt');
    },
    cells: [
      DataCell(
        Row(
          children: [
            Image.asset('assets/images/iphone13.png', width: 32, height: 32),
            const SizedBox(width: 8),
            const Text('iPhone 13 Pro'),
          ],
        ),
      ),
      const DataCell(Text('Gadgets')),
      const DataCell(Text('₦1,225,000.00')),
      const DataCell(Text('8')),
      const DataCell(Text('₦0.00')),
      const DataCell(Text('₦50,000.00')),
      DataCell(
        AppButton(
          desc: "Unpublish",
          onPressed: () {},
          isSuffixIcon: true,
          suffixIconPath: 'assets/icons/chevron-down.svg',
          backgroundColor: Color(0xFFF8FAFC),
          descStyle: AppTextStyles.black3ColorLabel1Regular,
          borderRadius: 12,
          height: 42,
          minWidth: 24,
          borderColor: Color(0xFFE2E8F0),
        ),
      ),
      const DataCell(Text('Published', style: TextStyle(color: Colors.blue))),
    ],
  ),
];
