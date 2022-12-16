import 'package:flutter/material.dart';

import 'package:push_notifications_app/presentation/screens/screens.dart';

class AppRouter {
  static final Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
    MessageScreen.routeName: (_) => const MessageScreen(),
  };
}
