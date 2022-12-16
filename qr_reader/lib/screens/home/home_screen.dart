import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/providers/providers.dart';

import 'package:qr_reader/widgets/widgets.dart';
import 'package:qr_reader/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () async {
              Provider.of<ScanListProvider>(context, listen: false)
                  .deleteAllScans();
            },
          ),
        ],
      ),
      body: const _HomeScreenBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const ScanButton(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    // Get the selected menu option from the provider
    final uiProvider = Provider.of<UiProvider>(context);

    // Change the current page using the selected menu option from the provider
    final currentIndex = uiProvider.selectedMenuOtp;

    // Use the ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    // Change the current page using the selected menu option from the provider
    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsScreen();
      case 1:
        scanListProvider.loadScansByType('http');
        return const UrlScreen();
      default:
        return const MapsScreen();
    }
  }
}
