library cross_maps;

import 'package:flutter/material.dart';

import 'cross_maps_stub.dart'
    if (dart.library.io) 'mobile_maps.dart'
    if (dart.library.html) 'web_maps.dart';

abstract class CrossMaps {
  Widget getMaps(double lat, double lng);
  void setPolyline(List<double> lats, List<double> lngs);
  factory CrossMaps() => getCrossMaps();
}
