import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';
import 'package:qr_reader/providers/providers.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  Future<ScanModel> addNewScan(String value) async {
    final tempScan = ScanModel(valor: value);
    final id = await DBProvider.db.nuevoScan(tempScan);
    // Assign the id of the database to the model
    tempScan.id = id;

    if (typeSelected == tempScan.tipo) {
      scans.add(tempScan);
      notifyListeners();
    }
    return tempScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...?scans];
    typeSelected = type;
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
  }
}
