import 'temperature_data_model.dart';
import 'weather.dart';
import 'wind_model.dart';

class WeatherItem {
  final DateTime dt;
  final TemperatureData main;
  final List<Weather> weather;
  final Wind wind;
  final int visibility;
  final DateTime dtTxt;

  WeatherItem({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    required this.visibility,
    required this.dtTxt,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    return WeatherItem(
      dt: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
      main: TemperatureData.fromJson(json["main"]),
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      wind: Wind.fromJson(json["wind"]),
      visibility: json["visibility"],
      dtTxt: DateTime.parse(json["dt_txt"]),
    );
  }
}
