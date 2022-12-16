import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/theme/app_theme.dart';
import 'package:qr_reader/providers/providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        theme: AppTheme.lightTheme,
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'mapa': (_) => const MapScreen(),
        },
      ),
    );
  }
}
