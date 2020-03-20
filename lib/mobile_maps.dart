import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cross_maps.dart';

class MobileMaps implements CrossMaps {
  static final MobileMaps _instance = MobileMaps._MobileMaps();

  static MobileMaps get instance => _instance;

  Completer<GoogleMapController> _controller;
  GoogleMap _maps;
  Set<Marker> markers;
  Set<Polyline> polylines;

  MobileMaps._MobileMaps() {
    markers = Set<Marker>();
    polylines = Set<Polyline>();
  }

  @override
  Widget getMaps(double lat, double lng, String title,
      {Function onTap,
      List<double> poly_lats,
      List<double> poly_lngs}) {
    markers.clear();
    polylines.clear();
    setPolyline(poly_lats, poly_lngs);
    _controller = Completer();
    _maps = GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(lat, lng), zoom: 11.0),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: onTap,
      markers: markers,
      polylines: polylines,
    );
    addMarker(lat, lng, title);
    return _maps;
  }

  @override
  void setPolyline(List<double> lats, List<double> lngs) {
    List<LatLng> path = List<LatLng>();
    if ((lats != null) && (lngs != null)) {
      for (int i = 0; i < lats.length; i++) {
        path.add(LatLng(lats[i], lngs[i]));
      }
      polylines.add(Polyline(
          points: path,
          polylineId: PolylineId('percorso'),
          width: 2,
          color: Colors.green));
    }
  }

  @override
  void addMarker(double lat, double lng, String title) async {
    markers.add(
      Marker(
          markerId: MarkerId('$title'),
          position: LatLng(lat, lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta)),
    );
  }
}

CrossMaps getCrossMaps() => MobileMaps.instance;
