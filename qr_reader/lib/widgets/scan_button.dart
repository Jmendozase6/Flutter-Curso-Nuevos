import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancel', false, ScanMode.BARCODE);
        if (barcodeScanRes == '-1') return;

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final newScan = await scanListProvider.addNewScan(barcodeScanRes);

        goToWebPage(context, newScan);
      },
    );
  }
}
