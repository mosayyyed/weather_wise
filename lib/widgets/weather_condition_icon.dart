import 'package:flutter/material.dart';
import 'package:weather_app_cubit/models/weather_model/weather_model.dart';

import '../helpers/weather_icon_helper.dart';

class WeatherConditionIcon extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherConditionIcon({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    DateTime forecastTime = weatherModel.forecast[0].dt;

    bool isDayTime = forecastTime.isAfter(weatherModel.city.sunrise) &&
        forecastTime.isBefore(weatherModel.city.sunset);

    String assetName =
        getWeatherIcon(weatherModel.forecast[0].weather[0].icon, isDayTime);

    return SizedBox(
      width: 130.0,
      child: Image.asset("assets/weather_icons/$assetName"),
    );
  }
}
