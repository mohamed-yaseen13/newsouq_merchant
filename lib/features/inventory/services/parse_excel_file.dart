import 'package:excel/excel.dart';
import 'dart:typed_data';
import 'package:newsouq_merchant/features/inventory/data/models/add_product_request_model.dart';
import 'package:newsouq_merchant/features/inventory/services/picked_images_group.dart';

class ParseExcelFile {
  static Future<List<AddProductRequestModel>> parse(
    Uint8List excelFileBytes,
    List<PickedImageGroup> productImageGroups,
  ) async {
    final excel = Excel.decodeBytes(excelFileBytes);
    final List<AddProductRequestModel> products = [];

    final sheet = excel.tables[excel.tables.keys.first];
    if (sheet == null) return products;

    for (int rowIndex = 1; rowIndex < sheet.maxRows; rowIndex++) {
      final row = sheet.row(rowIndex);

      final name = row[0]?.value?.toString() ?? '';
      final category = row[1]?.value?.toString() ?? '';
      final costPrice = double.tryParse(row[2]?.value?.toString() ?? '0') ?? 0;
      final quantity = int.tryParse(row[3]?.value?.toString() ?? '0') ?? 0;
      final discount = double.tryParse(row[4]?.value?.toString() ?? '0') ?? 0;
      final description = row[5]?.value?.toString() ?? '';
      final sellingPrice = costPrice - (costPrice * discount / 100);

      final matchedImages = productImageGroups
          .firstWhere(
            (group) => group.productName == name,
            orElse: () => PickedImageGroup(name, []),
          )
          .images;

      products.add(
        AddProductRequestModel(
          name: name,
          category: category,
          costPrice: costPrice,
          quantity: quantity,
          discount: discount,
          sellingPrice: sellingPrice,
          description: description,
          images: matchedImages,
        ),
      );
    }

    return products;
  }
}
