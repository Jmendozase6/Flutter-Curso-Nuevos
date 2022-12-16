import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/router/app_routes.dart';
import 'package:productos_app/theme/app_theme.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      theme: AppTheme.lightTheme,
      initialRoute: CheckAuthScreen.routeName,
      routes: AppRoutes.routes,
      scaffoldMessengerKey: NotificationService.messengerKey,
    );
  }
}
