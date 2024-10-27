class TemperatureData {
  final int temp;
  final int feelsLike;
  final int tempMin;
  final int tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;

  TemperatureData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
  });

  factory TemperatureData.fromJson(Map<String, dynamic> json) {
    return TemperatureData(
      temp: json["temp"].floor(),
      feelsLike: json["feels_like"].floor(),
      tempMin: json["temp_min"].floor(),
      tempMax: json["temp_max"].floor(),
      pressure: json["pressure"],
      seaLevel: json["sea_level"],
      grndLevel: json["grnd_level"],
      humidity: json["humidity"],
    );
  }
}
