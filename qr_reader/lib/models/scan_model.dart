// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    valor.contains('http') ? tipo = 'http' : tipo = 'geo';
  }

  int? id;
  String? tipo;
  String valor;

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  LatLng getlatLng() {
    final latLng = valor.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);
    return LatLng(lat, lng);
  }

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
