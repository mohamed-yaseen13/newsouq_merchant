import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsouq_merchant/core/routing/app_router.dart';
import 'package:newsouq_merchant/core/routing/app_routes.dart';

class NewSouqMerchantApp extends StatelessWidget {
  const NewSouqMerchantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.signupScreen,
          onGenerateRoute: AppRouter.generateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          ),
        );
      },
    );
  }
}
