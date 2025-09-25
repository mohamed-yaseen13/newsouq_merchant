import 'dart:typed_data';

class PickedImageGroup {
  final String productName;
  final List<Uint8List> images;
  PickedImageGroup(this.productName, this.images);
}
