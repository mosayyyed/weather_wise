class Wind {
  final double speed;
  final int deg;
  final double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    var wind = json['list'][0]['wind'];

    return Wind(
      speed: wind['speed'],
      deg: wind['deg'],
      gust: wind['gust'],
    );
  }
}
