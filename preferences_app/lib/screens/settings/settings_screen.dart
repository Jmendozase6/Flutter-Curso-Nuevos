import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:preferences_app/preferences/preferences.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                title: const Text('DarkMode'),
                value: UserPreferences.isDarkMode,
                onChanged: (value) {
                  UserPreferences.isDarkMode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                title: const Text('Male'),
                value: 1,
                groupValue: UserPreferences.gender,
                onChanged: (value) {
                  UserPreferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                title: const Text('Female'),
                value: 2,
                groupValue: UserPreferences.gender,
                onChanged: (value) {
                  UserPreferences.gender = value ?? 2;
                  setState(() {});
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    UserPreferences.name = value;
                    setState(() {});
                  },
                  initialValue: UserPreferences.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'Name',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
