import 'clouds_model.dart';
import 'main_model.dart';
import 'sys_model.dart';
import 'wether.dart';
import 'wind_model.dart';

class WeatherItem {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
  Sys sys;
  DateTime dtTxt;

  WeatherItem({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    print(json);
    return WeatherItem(
      dt: json["dt"],
      main: Main.fromJson(json["main"]),
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      clouds: Clouds.fromJson(json["clouds"]),
      wind: Wind.fromJson(json["wind"]),
      visibility: json["visibility"],
      pop: json["pop"]?.toDouble(),
      sys: Sys.fromJson(json["sys"]),
      dtTxt: DateTime.parse(json["dt_txt"]),
    );
  }
}
