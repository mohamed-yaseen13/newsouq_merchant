import 'dart:io';
import 'dart:typed_data';

class ExtractImages {
  static Future<List<Uint8List>> loadImagesForProduct(
    String productName,
    String folderPath,
  ) async {
    final List<Uint8List> images = [];
    final Directory productDir = Directory('$folderPath/$productName');

    if (await productDir.exists()) {
      final files = productDir.listSync();
      for (var file in files) {
        if (file is File &&
            (file.path.endsWith('.jpg') ||
                file.path.endsWith('.png') ||
                file.path.endsWith('.jpeg') ||
                file.path.endsWith('.gif'))) {
          final bytes = await file.readAsBytes();
          images.add(bytes);
        }
      }
    }
    return images;
  }
}
