import 'package:flutter/material.dart';
import 'package:preferences_app/preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode: ${UserPreferences.isDarkMode}'),
          const Divider(),
          Text("Gender: ${UserPreferences.gender == 1 ? 'Male' : 'Female'}"),
          const Divider(),
          Text('Name ${UserPreferences.name}'),
          const Divider(),
        ],
      ),
    );
  }
}
