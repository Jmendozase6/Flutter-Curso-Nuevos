import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> goToWebPage(BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if (scan.tipo == 'http') {
    //Open the web page
    if (!await launchUrlString(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
