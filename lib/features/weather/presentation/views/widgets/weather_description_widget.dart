import 'package:flutter/material.dart';

import '../../../data/models/weather_model/weather_model.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherDescriptionWidget({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "${weatherModel.forecast[0].weather[0].description} - H:${weatherModel.forecast[0].main.tempMax}° L:${weatherModel.forecast[0].main.tempMin}°",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}
