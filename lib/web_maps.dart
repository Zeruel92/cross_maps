import 'dart:html';
import 'dart:ui' as ui;

import 'package:cross_maps/cross_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';

GMap _gmap;
List<Marker> markers = <Marker>[];

class WebMaps implements CrossMaps {


  @override
  Widget getMaps(double lat, double lng, String title,
      {Function onTap, List<double> poly_lats, List<double> poly_lngs}) {
    String htmlId = "7";
    final mapOptions = MapOptions()
      ..zoom = 8
      ..center = LatLng(lat, lng)
      ..mapTypeId = MapTypeId.TERRAIN
      ..backgroundColor = '#ffffff';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      var elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';
      _gmap = GMap(elem, mapOptions);
      _gmap.onClick.listen((event) {
        onTap(event.latLng.lat, event.latLng.lng);
      });

      addMarker(lat, lng, title);
      setPolyline(poly_lats, poly_lngs);
      return elem;
    });
    return HtmlElementView(viewType: htmlId);
  }

  @override
  void addMarker(double lat, double lng, String title) {
    Marker marker = Marker(MarkerOptions()
      ..position = LatLng(lat, lng)
      ..map = _gmap
      ..title = "Posizione: $title"
      ..clickable = true
      ..draggable = true);
    markers.add(marker);
  }

  void clearMarkers() {
    for (final m in markers) {
      m.map = null;
    }
    markers.clear();
  }

  @override
  void setPolyline(List<double> lats, List<double> lngs) {
    List<LatLng> path;
    for (int i = 0; i < lats.length; i++) {
      path.add(LatLng(lats[i], lngs[1]));
    }
    Polyline(PolylineOptions()
      ..map = _gmap
      ..path = path);
  }
}

CrossMaps getCrossMaps() => WebMaps();
