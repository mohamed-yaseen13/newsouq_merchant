import 'dart:async';
import 'dart:typed_data';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:js_util' as js_util;

import 'package:newsouq_merchant/features/inventory/services/picked_images_group.dart';

class GroupImages {
  static Future<List<PickedImageGroup>> groupImagesByProduct(
    List<html.File> files,
  ) async {
    final Map<String, List<Uint8List>> grouped = {};

    for (final file in files) {
      final relativePath = js_util.getProperty<String>(
        file,
        'webkitRelativePath',
      );

      final segments = relativePath.split('/');
      final productName = (segments.length >= 2)
          ? segments[1]
          : 'UNKNOWN_PRODUCT';

      final reader = html.FileReader();
      final completer = Completer<Uint8List>();

      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((_) {
        completer.complete(reader.result as Uint8List);
      });

      final bytes = await completer.future;

      grouped.putIfAbsent(productName, () => []).add(bytes);
    }

    return grouped.entries
        .map((entry) => PickedImageGroup(entry.key, entry.value))
        .toList();
  }
}
