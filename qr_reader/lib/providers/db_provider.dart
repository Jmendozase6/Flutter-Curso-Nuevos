import 'dart:io';
import 'package:qr_reader/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    //Path for store the database
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //Create the database
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
      ''');
    });
  }

  Future<int> nuevoScan(ScanModel newScan) async {
    final db = await database;
    final res = await db!.insert('Scans', newScan.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromMap(res.first) : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final db = await database;
    final res = await db!.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  Future<List<ScanModel>?> getScansByType(String type) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'tipo = ?', whereArgs: [type]);
    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = db!.update('Scans', newScan.toMap(),
        where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = db!.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = db!.delete('Scans');
    return res;
  }
}
