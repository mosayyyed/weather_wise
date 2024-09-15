class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['city']['coord']['lon'],
      lat: json['city']['coord']['lat'],
    );
  }
}
