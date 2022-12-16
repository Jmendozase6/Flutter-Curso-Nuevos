import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return scans.isNotEmpty
        ? ListView.builder(
            itemCount: scans.length,
            itemBuilder: (_, int index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                onDismissed: (DismissDirection direction) {
                  Provider.of<ScanListProvider>(context, listen: false)
                      .deleteScanById(scans[index].id!);
                },
                child: ListTile(
                  leading: Icon(tipo == 'http' ? Icons.map : Icons.link,
                      color: Theme.of(context).primaryColor),
                  title: Text(scans[index].valor),
                  subtitle: Text('${scans[index].id}'),
                  trailing: const Icon(Icons.keyboard_arrow_right,
                      color: Colors.grey),
                  onTap: () => goToWebPage(context, scans[index]),
                ),
              );
            },
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/scan.png', width: 200),
                const Text('You should scan something to start ;)'),
              ],
            ),
          );
  }
}
