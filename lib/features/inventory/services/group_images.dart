import 'dart:async';
import 'dart:typed_data';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'package:web/web.dart' as web;

import 'package:newsouq_merchant/features/inventory/services/picked_images_group.dart';

extension WebFileRelativePath on web.File {
  String get relativePath {
    final jsValue = (this as JSObject).getProperty('webkitRelativePath'.toJS);
    return jsValue != null ? (jsValue as JSString).toDart : name;
  }
}

class GroupImages {
  static Future<List<PickedImageGroup>> groupImagesByProduct(
    List<web.File> files,
  ) async {
    final Map<String, List<Uint8List>> grouped = {};

    for (final file in files) {
      final relativePath = file.relativePath;
      final segments = relativePath.split('/');
      final productName = (segments.length >= 2)
          ? segments[1]
          : 'UNKNOWN_PRODUCT';

      final reader = web.FileReader();
      final completer = Completer<Uint8List>();

      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((_) {
        final result = reader.result;
        if (result != null) {
          final buffer = result as JSArrayBuffer;
          final dartBuffer = buffer.toDart;
          completer.complete(Uint8List.view(dartBuffer));
        } else {
          completer.completeError('Failed to read file: ${file.name}');
        }
      });

      final bytes = await completer.future;
      grouped.putIfAbsent(productName, () => []).add(bytes);
    }

    return grouped.entries
        .map((entry) => PickedImageGroup(entry.key, entry.value))
        .toList();
  }
}
