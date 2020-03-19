# cross_maps

A cross platform for web and mobile for showing google maps that combine [Google Maps Flutter][1] for mobile and 
[Google Maps][2] for web.

## Installing

- Add into pubspec.yaml 
```yaml
cross_picker:
    git:
      url: https://github.com/pspgt/cross_maps.git
```
- run `flutter pub get`
- Now import with `import 'package:cross_maps/cross_maps.dart';`

# Example 

```dart
CrossMaps crossMaps = CrossMaps();
crossMaps.getMaps(lat,lng);
```

Adding a Polyline

```dart
List<double> lats;
List<double> lngs;
crossMaps.setPolyline(lats,lngs);
```
[//]: #Links
[1]: https://pub.dev/packages/google_maps_flutter
[2]: https://pub.dev/packages/google_maps