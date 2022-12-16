import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOtp;

    return BottomNavigationBar(
      onTap: (index) => uiProvider.selectedMenuOtp = index,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.link),
          label: 'Urls',
        ),
      ],
    );
  }
}
