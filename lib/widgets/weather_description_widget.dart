import 'package:flutter/material.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  final double maxTemp, minTemp;
  const WeatherDescriptionWidget({
    super.key,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Sunny - H:$maxTemp° L:$minTemp°",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}
