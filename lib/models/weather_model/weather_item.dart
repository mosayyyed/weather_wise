import 'temperature_data_model.dart';
import 'wether.dart';
import 'wind_model.dart';

class WeatherItem {
  int dt;
  TemperatureData main;
  List<Weather> weather;
  Wind wind;
  int visibility;
  double pop;
  DateTime dtTxt;

  WeatherItem({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.dtTxt,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    return WeatherItem(
      dt: json["dt"],
      main: TemperatureData.fromJson(json["main"]),
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      wind: Wind.fromJson(json["wind"]),
      visibility: json["visibility"],
      pop: json["pop"]?.toDouble(),
      dtTxt: DateTime.parse(json["dt_txt"]),
    );
  }
}
