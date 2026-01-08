import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/app_colors.dart';
import 'constants/app_routes.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/package_screen.dart';
import 'screens/drink_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/promo_screen.dart';
import 'services/cart_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartService(),
      child: MaterialApp(
        title: 'King Chicken',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryOrange),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.splash,
        routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.packages: (context) => const PackageScreen(),
        AppRoutes.drinks: (context) => const DrinkScreen(),
        AppRoutes.cart: (context) => const CartScreen(),
        AppRoutes.payment: (context) => const PaymentScreen(),
        AppRoutes.promos: (context) => const PromoScreen(),
      },
      ),
    );
  }
}


