import 'dart:html';
import 'dart:ui' as ui;

import 'package:cross_maps/cross_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';

class WebMaps implements CrossMaps {
  @override
  Widget getMaps(double lat, double lng) {
    String htmlId = "7";

    final mapOptions = new MapOptions()
      ..zoom = 8
      ..center = new LatLng(lat, lng)
      ..mapTypeId = MapTypeId.TERRAIN
      ..backgroundColor = '#ffffff';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}

CrossMaps getCrossMaps() => WebMaps();
