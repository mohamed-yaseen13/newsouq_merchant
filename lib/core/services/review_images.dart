//import 'dart:io';
//import 'package:nsfw_detector_flutter/nsfw_detector_flutter.dart';
//
//class ReviewImages {
//  static Future<List<File>> reviewImages(List<File> images) async {
//    final nsfwDetector = await NsfwDetector.load(threshold: 0.01);
//
//    final List<File> response = [];
//
//    for (var image in images) {
//      final result = await nsfwDetector.detectNSFWFromFile(image);
//      if (result?.isNsfw == false) {
//        response.add(image);
//      }
//    }
//    return response;
//  }
//}
