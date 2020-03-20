library cross_maps;

import 'package:flutter/material.dart';

import 'cross_maps_stub.dart'
    if (dart.library.io) 'mobile_maps.dart'
    if (dart.library.html) 'web_maps.dart';

abstract class CrossMaps {
  Widget getMaps(double lat, double lng, String title,
      {Function onTap,
      List<double> poly_lats,
      List<double> poly_lngs});
  void setPolyline(List<double> lats, List<double> lngs);
  void addMarker(double lat, double lng, String title);
  factory CrossMaps() => getCrossMaps();
}
