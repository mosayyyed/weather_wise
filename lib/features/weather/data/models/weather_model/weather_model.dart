import 'city_model.dart';
import 'weather_item.dart';

class WeatherModel {
  final City city;
  final List<WeatherItem> forecast;

  WeatherModel({
    required this.city,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: City.fromJson(json['city']),
      forecast: List<WeatherItem>.from(
        json['list'].map((item) => WeatherItem.fromJson(item)),
      ),
    );
  }
}
