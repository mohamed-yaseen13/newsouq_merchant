import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newsouq_merchant/core/constants/database_constants.dart';
import 'package:newsouq_merchant/core/helpers/shared_pref.dart';
import 'package:newsouq_merchant/features/inventory/data/models/add_product_request_model.dart';
import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
// ignore: implementation_imports
import 'package:cloudinary_api/src/request/model/uploader_params.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'dart:convert';

class AddProductApiService {
  final FirebaseFirestore firestore;
  final Cloudinary cloudinary;

  AddProductApiService({required this.firestore, required this.cloudinary});

  Future<void> addProduct(AddProductRequestModel model) async {
    final List<String> secureImagesUrl = [];

    try {
      cloudinary.config.urlConfig.secure = true;
      for (int i = 0; i < model.images.length; i++) {
        final bytes = model.images[i];
        final base64Image = base64Encode(bytes);
        final imageUrl = await cloudinary.uploader().upload(
          "data:image/png;base64,$base64Image",
          params: UploadParams(
            uniqueFilename: false,
            overwrite: true,
            resourceType: 'image',
          ),
        );
        secureImagesUrl.add(imageUrl!.data!.url!);
      }
    } catch (error) {
      debugPrint('error from cloudinary ${error.toString()}');
    }

    final productData = {
      'name': model.name,
      'category':
          model.category[0].toUpperCase() +
          model.category.substring(1).toLowerCase(),
      'costPrice': model.costPrice,
      'quantity': model.quantity,
      'discount': model.discount,
      'sellingPrice': model.sellingPrice,
      'description': model.description,
      'imagesUrl': secureImagesUrl,
    };

    final sellerEmail = SharedPref.getUserEmail();

    await firestore
        .collection(DatabaseConstants.merchantsCollection)
        .doc(sellerEmail)
        .collection(DatabaseConstants.productsCollection)
        .add(productData);

    await firestore
        .collection(DatabaseConstants.merchantsCollection)
        .doc(sellerEmail)
        .set({
          DatabaseConstants.categoriesCollection: FieldValue.arrayUnion([
            model.category[0].toUpperCase() +
                model.category.substring(1).toLowerCase(),
          ]),
        }, SetOptions(merge: true));
  }
}
