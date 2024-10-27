import 'package:flutter/material.dart';

import '../../../data/models/weather_model/weather_model.dart';
import 'weather_condition_icon.dart';
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
            WeatherConditionIcon(
              weatherModel: weatherModel,
            ),
            const SizedBox(width: 16.0),
            SizedBox(
              width: 170.0,
              child: Center(
                child: Text(
                  '${weatherModel.forecast[0].main.temp}°',
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
          weatherModel: weatherModel,
        ),
      ],
    );
  }
}
