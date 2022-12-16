import 'package:flutter/material.dart';
import 'package:fl_components/models/models.dart';

import 'package:fl_components/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // const MenuOption(
    //     route: 'home',
    //     name: 'Home Screen',
    //     screen: HomScreen(),
    //     icon: Icons.home),
    const MenuOption(
        route: 'listview1',
        name: 'List View 1',
        screen: ListView1Screen(),
        icon: Icons.list),
    const MenuOption(
        route: 'listview2',
        name: 'List View 2',
        screen: ListView2Screen(),
        icon: Icons.list_alt),
    const MenuOption(
        route: 'alert',
        name: 'Alert Screen',
        screen: AlertScreen(),
        icon: Icons.add_alert_outlined),
    const MenuOption(
        route: 'card',
        name: 'Card Screen',
        screen: CardScreen(),
        icon: Icons.credit_card),
    const MenuOption(
        route: 'avatar',
        name: 'Avatar Screen',
        screen: AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
    const MenuOption(
        route: 'animated',
        name: 'Animated Screen',
        screen: AnimatedScreen(),
        icon: Icons.animation),
    const MenuOption(
        route: 'inputs',
        name: 'Inputs Screen',
        screen: InputsScreen(),
        icon: Icons.animation),
    const MenuOption(
        route: 'slider',
        name: 'Slider && Checks',
        screen: SliderScreen(),
        icon: Icons.slow_motion_video_rounded),
    const MenuOption(
        route: 'listview_builder',
        name: 'Infinite Scroll && Pull To Refresh',
        screen: ListViewBuilderScreen(),
        icon: Icons.refresh),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (context) => const HomScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
