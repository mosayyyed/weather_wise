import 'package:flutter/material.dart';
import 'package:weather_app_cubit/models/weather_model/weather_model.dart';

class SummaryCard extends StatelessWidget {
  final WeatherModel weatherModel;
  const SummaryCard({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
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
            stops: const [0.0, 1.0],
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.4),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
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
            _buildSectionTitle('Temperature'),
            _buildWeatherDetail('Date:', weatherModel.temperatureData.date),
            _buildWeatherDetail(
                'Current Temp:', '${weatherModel.temperatureData.temp}°C'),
            _buildWeatherDetail(
                'Feels Like:', '${weatherModel.temperatureData.feelsLike}°C'),
            _buildWeatherDetail(
                'Min Temp:', '${weatherModel.temperatureData.tempMax}°C'),
            _buildWeatherDetail(
                'Max Temp:', '${weatherModel.temperatureData.tempMin}°C'),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Wind'),
            _buildWeatherDetail('Speed:', '${weatherModel.wind.speed}km/h'),
            _buildWeatherDetail('Gust:', '${weatherModel.wind.gust} km/h'),
            _buildWeatherDetail('Direction:', '${weatherModel.wind.deg}°'),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Pressure'),
            _buildWeatherDetail(
                'Pressure:', '${weatherModel.temperatureData.pressure} hPa'),
            _buildWeatherDetail(
                'Sea Level:', '${weatherModel.temperatureData.seaLevel} hPa'),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Humidity'),
            _buildWeatherDetail(
                'Humidity:', '${weatherModel.temperatureData.humidity}%'),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Location'),
            _buildWeatherDetail(
                'Longitude:', '${weatherModel.city.coord.lon}°'),
            _buildWeatherDetail('Latitude:', '${weatherModel.city.coord.lat}°'),
            _buildWeatherDetail('Sunrise:', '${weatherModel.city.sunrise}'),
            _buildWeatherDetail('Sunset:', '${weatherModel.city.sunset}'),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
