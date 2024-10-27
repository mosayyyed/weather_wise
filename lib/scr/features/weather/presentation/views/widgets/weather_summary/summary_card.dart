import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/weather_model/weather_model.dart';
import 'read_more_button.dart';
import 'section_title.dart';
import 'weather_detail.dart';

class SummaryCard extends StatefulWidget {
  final WeatherModel weatherModel;

  const SummaryCard({super.key, required this.weatherModel});

  @override
  SummaryCardState createState() => SummaryCardState();
}

class SummaryCardState extends State<SummaryCard> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    final forecast = widget.weatherModel.forecast[0];
    final city = widget.weatherModel.city;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.4),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weather Summary',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          const SectionTitle(title: 'Temperature'),
          WeatherDetail(
              title: 'Date:',
              value: DateFormat('yy/MM/dd hh:mm a').format(forecast.dt)),
          WeatherDetail(
              title: 'Current Temp:', value: '${forecast.main.temp}°C'),
          WeatherDetail(
              title: 'Feels Like:', value: '${forecast.main.feelsLike}°C'),
          if (_showMore) ...[
            WeatherDetail(
                title: 'Min Temp:', value: '${forecast.main.tempMin}°C'),
            WeatherDetail(
                title: 'Max Temp:', value: '${forecast.main.tempMax}°C'),
            const SizedBox(height: 16.0),
            const SectionTitle(title: 'Wind'),
            WeatherDetail(
                title: 'Speed:', value: '${forecast.wind.speed} km/h'),
            WeatherDetail(title: 'Gust:', value: '${forecast.wind.gust} km/h'),
            WeatherDetail(title: 'Direction:', value: '${forecast.wind.deg}°'),
            const SizedBox(height: 16.0),
            const SectionTitle(title: 'Pressure'),
            WeatherDetail(
                title: 'Pressure:', value: '${forecast.main.pressure} hPa'),
            WeatherDetail(
                title: 'Sea Level:', value: '${forecast.main.seaLevel} hPa'),
            const SizedBox(height: 16.0),
            const SectionTitle(title: 'Humidity'),
            WeatherDetail(
              title: 'Humidity:',
              value: '${forecast.main.humidity}%',
            ),
            const SizedBox(height: 16.0),
            const SectionTitle(title: 'Location'),
            WeatherDetail(title: 'Longitude:', value: '${city.coord.lon}°'),
            WeatherDetail(title: 'Latitude:', value: '${city.coord.lat}°'),
            WeatherDetail(title: 'Sunrise:', value: city.getFormattedSunrise()),
            WeatherDetail(title: 'Sunset:', value: city.getFormattedSunset()),
          ],
          const SizedBox(height: 16.0),
          ReadMoreButton(
            showMore: _showMore,
            onPressed: () {
              setState(() {
                _showMore = !_showMore;
              });
            },
          ),
        ],
      ),
    );
  }
}
