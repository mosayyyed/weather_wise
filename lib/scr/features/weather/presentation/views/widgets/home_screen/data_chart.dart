import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app_cubit/scr/features/weather/data/models/weather_model/weather_model.dart';

class DataChart extends StatelessWidget {
  final WeatherModel weatherModel;

  const DataChart({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = weatherModel.forecast.map((item) {
      return ChartData(
        dateTime: item.dt,
        temp: item.main.temp.toDouble(),
      );
    }).toList();

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: MediaQuery.of(context).size.width,
      height: 240,
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
      child: SfCartesianChart(
        margin: EdgeInsets.zero,
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat('dd MMM'),
          intervalType: DateTimeIntervalType.hours,
          majorGridLines: const MajorGridLines(width: 1),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        primaryYAxis: const NumericAxis(
          labelFormat: '{value}°C',
          majorGridLines: MajorGridLines(width: 0),
          labelStyle: TextStyle(color: Colors.white, fontSize: 12),
        ),
        series: <CartesianSeries<ChartData, DateTime>>[
          SplineSeries<ChartData, DateTime>(
            dataSource: chartData,
            xValueMapper: (data, _) => data.dateTime,
            yValueMapper: (data, _) => data.temp,
            color: Colors.blue,
            width: 2,
            markerSettings: const MarkerSettings(
              isVisible: false,
            ),
            splineType: SplineType.natural,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )), // Hide data labels if not needed
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData({required this.dateTime, required this.temp});

  final DateTime dateTime;
  final double temp;
}
