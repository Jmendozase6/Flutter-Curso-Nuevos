import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_reader/models/models.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    print(scan.getlatLng());
    CameraPosition initialPosition = CameraPosition(
      target: scan.getlatLng(),
      zoom: 17.5,
      tilt: 40,
    );

    // Markers
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getlatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cords'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getlatLng(),
                    zoom: 17.5,
                    tilt: 40,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.location_on_sharp),
          )
        ],
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(mapType == MapType.normal ? Icons.map : Icons.satellite),
        onPressed: () {
          mapType =
              mapType == MapType.normal ? MapType.satellite : MapType.normal;
          setState(() {});
        },
      ),
    );
  }
}
