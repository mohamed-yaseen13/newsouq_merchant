// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
AddProductRequestModel _$AddProductRequestModelFromJson(
  Map<String, dynamic> json,
) => AddProductRequestModel(
  name: json['name'] as String,
  category: json['category'] as String,
  costPrice: (json['costPrice'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  discount: (json['discount'] as num).toDouble(),
  sellingPrice: (json['sellingPrice'] as num).toDouble(),
  description: json['description'] as String,
  images: (json['imagesUrl'] as List<dynamic>)
      .map((e) => e as Uint8List)
      .toList(),
);

Map<String, dynamic> _$AddProductRequestModelToJson(
  AddProductRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'category': instance.category,
  'costPrice': instance.costPrice,
  'quantity': instance.quantity,
  'discount': instance.discount,
  'sellingPrice': instance.sellingPrice,
  'description': instance.description,
  'imagesUrl': instance.images,
};
