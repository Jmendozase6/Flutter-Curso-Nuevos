import 'package:flutter/material.dart';
import 'package:designs_app/screens/screens.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      initialRoute: 'home_screen',
      theme: ThemeData.dark(),
      routes: {
        'basic_design': (_) => const BasicDesignScreen(),
        'scroll': (_) => const ScrollDesignScreen(),
        'home_screen': (_) => const HomeScreen(),
      },
    );
  }
}
