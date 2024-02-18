
import 'package:flutter/material.dart';

const TextStyle _headerFontStyle      = TextStyle(fontWeight: FontWeight.bold, fontSize: 30, height: 2);
const TextStyle _entryFontStyle       = TextStyle(fontSize: 30, height: 0);

const List<String> weatherGridHeaders = ["temperature", "forecast", "wind speed", "wind direction"];
const List<String> weatherGridKeys    = ["temperature", "detailedForecast", "windSpeed", "windDirection"];

List<Widget> getWeatherGridHeader() {
  List<Widget> weatherWidgets = weatherGridHeaders.map((header) => Text(header, style: _headerFontStyle)).toList();
  return weatherWidgets.map((widget) => padWeatherGridTile(widget)).toList();
}

Widget padWeatherGridTile(Widget gridTile) {
  return Padding(padding: const EdgeInsets.only(left: 10.0), child: gridTile);
}

List<Widget> getWeatherGridEntry(Map<String, dynamic> forecastMap) {
  /*
  forecastMap has keys: 
  {
    "name": "today",
    "temperature": "35",
    "shortForecast": "Snowy",
    "detailedForecast": "Snowy all day",
    "windSpeed": "10",
    "windDirection": "SE",
    "isDaytime": "true",
    "probabilityOfPercipitation": "100",
  }
  */

  return weatherGridKeys.map((value) => Text(forecastMap[value], style: _entryFontStyle)).toList();
}

List<Widget> getWeatherGridEntries(List<Map<String, dynamic>> forecastMaps) {
  List<Widget> forecastWidgets = forecastMaps.expand((forecastMap) => getWeatherGridEntry(forecastMap)).toList();
  return forecastWidgets.map((widget) => padWeatherGridTile(widget)).toList();
}

class WeatherGrid extends StatelessWidget {
  const WeatherGrid(this.forecastMaps, {super.key});
  final List<Map<String, dynamic>> forecastMaps;

  @override
  Widget build(BuildContext context) {
    List<Widget> gridEntries = [...getWeatherGridHeader(), ...getWeatherGridEntries(forecastMaps)];
    Widget gridView = GridView.count(
      crossAxisCount: 4,
      children: gridEntries,
    );
    return Container(child: gridView);
  }
}
