import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
    LoginScreen.routeName: (_) => const LoginScreen(),
    ProductScreen.routeName: (_) => const ProductScreen(),
    RegisterScreen.routeName: (_) => const RegisterScreen(),
    CheckAuthScreen.routeName: (_) => const CheckAuthScreen(),
  };
}
