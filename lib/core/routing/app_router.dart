import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq_merchant/core/di/di.dart';
import 'package:newsouq_merchant/core/routing/app_routes.dart';
import 'package:newsouq_merchant/features/chat/presentation/screens/chat_screen.dart';
import 'package:newsouq_merchant/features/customers/presentation/screens/customers_screen.dart';
import 'package:newsouq_merchant/features/home/presentation/screens/home_screen.dart';
import 'package:newsouq_merchant/features/inventory/presentation/screen/inventory_screen.dart';
import 'package:newsouq_merchant/features/login/presentation/cubit/login_cubit.dart';
import 'package:newsouq_merchant/features/login/presentation/screen/login_screen.dart';
import 'package:newsouq_merchant/features/orders/presentation/screens/orders_screen.dart';
import 'package:newsouq_merchant/features/settings/presentation/screens/settings_screen.dart';
import 'package:newsouq_merchant/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:newsouq_merchant/features/signup/presentation/screen/signup_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignupScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.ordersScreen:
        return MaterialPageRoute(
          builder: (_) => OrdersScreen(),
          settings: settings,
        );

      case AppRoutes.customersScreen:
        return MaterialPageRoute(
          builder: (_) => CustomersScreen(),
          settings: settings,
        );

      case AppRoutes.inventoryScreen:
        return MaterialPageRoute(
          builder: (_) => InventoryScreen(),
          settings: settings,
        );

      case AppRoutes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => ChatScreen(),
          settings: settings,
        );

      case AppRoutes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
