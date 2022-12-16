import 'package:flutter/material.dart';
import 'package:preferences_app/preferences/user_preferences.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                ThemeProvider(isDarkMode: UserPreferences.isDarkMode)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferences App',
      initialRoute: HomeScreen.routeName,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
    );
  }
}
