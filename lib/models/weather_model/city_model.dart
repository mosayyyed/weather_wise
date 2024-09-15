import 'coord_model.dart';

class City {
  final String name;
  final String country;
  final Coord coord;
  final int sunrise;
  final int sunset;

  City({
    required this.name,
    required this.country,
    required this.coord,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['city']['name'],
      country: json['city']['country'],
      coord: Coord.fromJson(json),
      sunrise: json['city']['sunrise'],
      sunset: json['city']['sunset'],
    );
  }
}
