import '../../../data/models/weather_model/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccess(this.weatherModel);
}

class WeatherError extends WeatherState {
  final String errorMessage;
  WeatherError(this.errorMessage);
}
