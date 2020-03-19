import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cross_maps.dart';

class MobileMaps implements CrossMaps {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMap _maps;
  Set<Marker> markers;

  MobileMaps() {
    markers = Set<Marker>();
  }

  @override
  Widget getMaps(double lat, double lng, String title) {
    markers.clear();
    _maps = GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(lat, lng), zoom: 11.0),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: markers,
    );
    addMarker(lat, lng, title);
    return _maps;
  }

  @override
  void setPolyline(List<double> lats, List<double> lngs) {
    List<LatLng> path;
    for (int i = 0; i < lats.length; i++) {
      path.add(LatLng(lats[i], lngs[1]));
    }
  }

  @override
  void addMarker(double lat, double lng, String title) async {
    markers.add(
      Marker(
        markerId: MarkerId('$title'),
        position: LatLng(lat, lng),
      ),
    );
  }
}

CrossMaps getCrossMaps() => MobileMaps();
