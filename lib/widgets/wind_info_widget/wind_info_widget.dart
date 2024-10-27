import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app_cubit/models/weather_model/weather_model.dart';

class WindInfoWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const WindInfoWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final wind = weatherModel.forecast[0].wind;

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
          _buildHeader(),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWindDetailCard(
                title: 'Speed',
                value: '${wind.speed.toStringAsFixed(1)} km/h',
                icon: Icons.speed,
              ),
              _buildWindDetailCard(
                title: 'Gust',
                value: '${wind.gust.toStringAsFixed(1)} km/h',
                icon: Icons.air,
              ),
              _buildWindDetailCard(
                title: 'Direction',
                value: '${wind.deg.toDouble()}°',
                icon: Icons.navigation,
                iconWidget: _buildWindDirectionIcon(wind.deg.toDouble()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Center(
      child: Row(
        children: [
          Icon(Icons.air, color: Colors.white, size: 30.0),
          SizedBox(width: 8.0),
          Text(
            'Wind Info',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWindDetailCard({
    required String title,
    required String value,
    required IconData icon,
    Widget? iconWidget,
  }) {
    return Card(
      color: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget ?? Icon(icon, color: Colors.white, size: 24.0),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14.0,
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
    );
  }

  Widget _buildWindDirectionIcon(double degree) {
    return Transform.rotate(
      angle: degree * pi / 180,
      child: const Icon(Icons.arrow_upward, color: Colors.white, size: 30.0),
    );
  }
}
