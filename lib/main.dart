import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq_merchant/core/di/di.dart';
import 'package:newsouq_merchant/firebase_options.dart';
import 'package:newsouq_merchant/new_souq_merchant_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  runApp(const NewSouqMerchantApp());
}
