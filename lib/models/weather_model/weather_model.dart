import 'city_model.dart';
import 'condition_model.dart';
import 'forecast_model.dart';
import 'temperature_data_model.dart';
import 'wind_model.dart';

class WeatherModel {
  final City city;
  final TemperatureData temperatureData;
  final Condition condition;
  final Wind wind;
  final ForecastList forecast;

  WeatherModel({
    required this.city,
    required this.temperatureData,
    required this.condition,
    required this.wind,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: City.fromJson(json['name']),
      temperatureData: TemperatureData.fromJson(json['main']),
      condition: Condition.fromJson(json['weather'][0]),
      wind: Wind.fromJson(json['wind']),
      forecast: ForecastList.fromJson(
          json['forecast']), // Ensure this matches your API structure
    );
  }
}
