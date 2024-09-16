class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    print(json);
    return Wind(
      speed: json["speed"]?.toDouble(),
      deg: json["deg"],
      gust: json["gust"]?.toDouble(),
    );
  }
}
