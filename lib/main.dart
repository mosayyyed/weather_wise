import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_cubit/cubit/wether_cubit/wether_cubit.dart';
import 'package:weather_app_cubit/services/weather_service.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetWeatherCubit(WeatherService(Dio()))..getWeather(cityName: "cairo"),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
          textTheme:
              GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme).apply(),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue, secondary: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
