
import 'package:flutter/material.dart';

String getLocationText(Map<String, String> locationMap) {
  return '${locationMap["city"]} ${locationMap["state"]}, ${locationMap["zip"]}';
}

class LocationWidget extends StatelessWidget {
  const LocationWidget(this.locationMap, {super.key});
  final Map<String, String> locationMap;

  @override
  Widget build(BuildContext context) {
    return Text(getLocationText(locationMap));
  }
}
