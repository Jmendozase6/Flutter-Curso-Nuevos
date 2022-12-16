import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/widgets.dart';

class UrlScreen extends StatelessWidget {
  const UrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'http');
  }
}
