import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq_merchant/core/di/di.dart';
import 'package:newsouq_merchant/firebase_options.dart';
import 'package:newsouq_merchant/new_souq_merchant_app.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();

  // ignore: deprecated_member_use
  CloudinaryContext.cloudinary = Cloudinary.fromCloudName(
    cloudName: 'dg1wipov1',
  );

  runApp(const NewSouqMerchantApp());
}
