class TemperatureData {
  final String date;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int humidity;

  TemperatureData({
    required this.date,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.humidity,
  });

  factory TemperatureData.fromJson(Map<String, dynamic> json) {
    var main = json['list'][0]['main'];
    return TemperatureData(
      date: DateTime.fromMillisecondsSinceEpoch(json['list'][0]['dt'] * 1000)
          .toString(),
      temp: main['temp'],
      feelsLike: main['feels_like'],
      tempMin: main['temp_min'],
      tempMax: main['temp_max'],
      pressure: main['pressure'],
      seaLevel: main['sea_level'] ?? 0,
      humidity: main['humidity'],
    );
  }
}
