import 'package:flutter/material.dart';
import 'package:news_provider_app/src/pages/pages.dart';
import 'package:news_provider_app/src/services/news_service.dart';
import 'package:news_provider_app/src/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        home: const TabsPage(),
        theme: appTheme,
      ),
    );
  }
}
