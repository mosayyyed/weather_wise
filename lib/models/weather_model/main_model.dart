class Main {
  int temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    print(json);
    return Main(
      temp: json["temp"].floor(),
      feelsLike: json["feels_like"]?.toDouble(),
      tempMin: json["temp_min"]?.toDouble(),
      tempMax: json["temp_max"]?.toDouble(),
      pressure: json["pressure"],
      seaLevel: json["sea_level"],
      grndLevel: json["grnd_level"],
      humidity: json["humidity"],
      tempKf: json["temp_kf"]?.toDouble(),
    );
  }
}
