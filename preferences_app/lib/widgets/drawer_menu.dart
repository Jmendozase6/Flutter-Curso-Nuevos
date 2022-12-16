import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader
          const _DrawerHeader(),

          // DrawerListTile
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.pushReplacementNamed(
                context, SettingsScreen.routeName),
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/menu-img.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(),
    );
  }
}
