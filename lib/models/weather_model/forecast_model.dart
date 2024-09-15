class Forecast {
  final DateTime date;
  final String icon;
  final double tempMin;
  final double tempMax;

  Forecast({
    required this.date,
    required this.icon,
    required this.tempMin,
    required this.tempMax,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      icon: json['weather'][0]['icon'] ?? '',
      tempMin: (json['main']['temp_min'] as num?)?.toDouble() ?? 0.0,
      tempMax: (json['main']['temp_max'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class ForecastList {
  final List<Forecast> forecasts;

  ForecastList({required this.forecasts});

  factory ForecastList.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Forecast> forecastList =
        list.map((item) => Forecast.fromJson(item)).toList();
    return ForecastList(forecasts: forecastList);
  }
}
