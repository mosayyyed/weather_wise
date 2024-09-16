import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_cubit/models/weather_model/weather_item.dart';
import 'package:weather_app_cubit/models/weather_model/weather_model.dart';

import '../helpers/weather_icon_helper.dart';

class WeatherForecastWidget extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherForecastWidget({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return SizedBox(
      height: 165,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          WeatherItem weatherItem = weatherModel.forecast[index * 8];

          DateTime forecastTime = DateTime.fromMillisecondsSinceEpoch(
              weatherModel.forecast[0].dt * 1000);

          bool isDayTime = forecastTime.isAfter(
                  DateTime.fromMillisecondsSinceEpoch(
                      weatherModel.city.sunrise * 1000)) &&
              forecastTime.isBefore(DateTime.fromMillisecondsSinceEpoch(
                  weatherModel.city.sunset * 1000));

          String day = (DateFormat('yyyy-MM-dd').format(forecastTime) ==
                  DateFormat('yyyy-MM-dd').format(now))
              ? 'Today'
              : DateFormat('EEE').format(forecastTime);

          String weatherIcon = getWeatherIcon(
            weatherItem.weather[0].icon,
            isDayTime,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.0),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 55.0,
                        width: 55.0,
                        child: Image.asset(
                          "assets/weather_icons/$weatherIcon",
                        ),
                      ),
                      Text(
                        "${weatherItem.main.temp}°",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Visibility(
                visible: index == 0,
                child: const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 14.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
