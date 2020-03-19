import 'package:flutter/src/widgets/framework.dart';

import 'cross_maps.dart';

class MobileMaps implements CrossMaps {
  @override
  Widget getMaps(double lat, double lng) {
    // TODO: implement getMaps
    throw UnimplementedError();
  }
}

CrossMaps getCrossMaps() => MobileMaps();
