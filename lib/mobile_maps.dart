import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cross_maps.dart';

class MobileMaps implements CrossMaps {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMap _maps;

  @override
  Widget getMaps(double lat, double lng, String title) {
    _maps = GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(target: LatLng(lat, lng)),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
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
    await _controller.future;
    _maps.markers.add(
      Marker(
        markerId: MarkerId('$title'),
        position: LatLng(lat, lng),
      ),
    );
  }
}

CrossMaps getCrossMaps() => MobileMaps();
