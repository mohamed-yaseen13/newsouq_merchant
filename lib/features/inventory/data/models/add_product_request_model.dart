import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

part 'add_product_request_model.g.dart';

@JsonSerializable()
class AddProductRequestModel {
  final String name;
  final String category;
  final double costPrice;
  final int quantity;
  final double discount;
  final double sellingPrice;
  final String description;
  final List<Uint8List> images;

  AddProductRequestModel({
    required this.name,
    required this.category,
    required this.costPrice,
    required this.quantity,
    required this.discount,
    required this.sellingPrice,
    required this.description,
    required this.images,
  });

  Map<String, dynamic> toJson() => _$AddProductRequestModelToJson(this);
}
