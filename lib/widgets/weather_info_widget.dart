import 'package:flutter/material.dart';

import '../models/weather_model/weather_model.dart';
import 'weather_description_widget.dart';

class WeatherInfoWidget extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherInfoWidget({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130.0,
              child: Image.asset("assets/weather_icons/day_sun_1.png"),
            ),
            const SizedBox(width: 16.0),
            SizedBox(
              width: 170.0,
              child: Center(
                child: Text(
                  weatherModel.forecast[0].main.temp.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 100.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        WeatherDescriptionWidget(
          maxTemp: weatherModel.forecast[0].main.tempMax,
          minTemp: weatherModel.forecast[0].main.tempMin,
        ),
      ],
    );
  }
}
