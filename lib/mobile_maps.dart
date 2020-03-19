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
      initialCameraPosition: CameraPosition(target: LatLng(lat, lng)),
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
    // TODO: implement setPolyline
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
