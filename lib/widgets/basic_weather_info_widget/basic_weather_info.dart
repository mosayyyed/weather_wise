import 'package:flutter/material.dart';
import 'package:weather_app_cubit/models/weather_model/weather_model.dart';

class BasicWeatherInfoWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const BasicWeatherInfoWidget({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
          _buildHeader(),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWeatherDetailCard(
                title: 'Feels Like',
                value: '${weatherModel.forecast[0].main.feelsLike}°C',
                icon: Icons.thermostat_outlined,
              ),
              _buildWeatherDetailCard(
                title: 'Min Temp',
                value: '${weatherModel.forecast[0].main.tempMin}°C',
                icon: Icons.thermostat,
              ),
              _buildWeatherDetailCard(
                title: 'Max Temp',
                value: '${weatherModel.forecast[0].main.tempMax}°C',
                icon: Icons.thermostat,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWeatherDetailCard(
                title: 'Pressure',
                value: '${weatherModel.forecast[0].main.pressure} hPa',
                icon: Icons.compress,
              ),
              _buildWeatherDetailCard(
                title: 'Sea Level',
                value: '${weatherModel.forecast[0].main.seaLevel} hPa',
                icon: Icons.water,
              ),
              _buildWeatherDetailCard(
                title: 'Humidity',
                value: '${weatherModel.forecast[0].main.humidity}%',
                icon: Icons.water_drop,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.info, color: Colors.white, size: 30.0),
        const SizedBox(width: 8.0),
        Text(
          'Basic Weather Info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherDetailCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Expanded(
      child: SizedBox(
        height: 120.0, // Fixed height for all cards
        child: Card(
          color: Colors.black.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 6.0,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: 22.0),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
