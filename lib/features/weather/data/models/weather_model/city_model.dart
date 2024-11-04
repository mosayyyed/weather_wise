import 'package:intl/intl.dart';

import 'coord_model.dart';

class City {
  final String name;
  final String country;
  final Coord coord;
  final DateTime sunrise;
  final DateTime sunset;

  City({
    required this.name,
    required this.country,
    required this.coord,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      country: json['country'],
      coord: Coord.fromJson(json['coord']),
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000),
    );
  }

  // Methods to format sunrise and sunset times as 'HH:mm' when needed
  String getFormattedSunrise() {
    return DateFormat('hh:mm a').format(sunrise);
  }

  String getFormattedSunset() {
    return DateFormat('hh:mm a').format(sunset);
  }
}
