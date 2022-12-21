import 'package:flutter/material.dart';
import 'package:news_provider_app/src/pages/tab1_page.dart';
import 'package:news_provider_app/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _CustomNavigation(),
      ),
    );
  }
}

class _CustomNavigation extends StatelessWidget {
  const _CustomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return SalomonBottomBar(
      currentIndex: navigationModel.currentIndex,
      onTap: (index) => navigationModel.currentIndex = index,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.person_outline),
          title: const Text('For u'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.public),
          title: const Text('Headers'),
        ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  get pageController => _pageController;

  int get currentIndex => _currentIndex;

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    _pageController.animateToPage(currentIndex,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}
