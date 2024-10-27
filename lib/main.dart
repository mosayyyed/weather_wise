import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_cubit/scr/core/utils/api_service.dart';
import 'package:weather_app_cubit/scr/features/weather/data/repository/weather_repo_impl.dart';
import 'package:weather_app_cubit/scr/features/weather/presentation/views/home_screen.dart';

import 'scr/features/weather/presentation/manger/wether_cubit/wether_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(WeatherRepoImpl(ApiService(Dio())))
        ..getWeather(cityName: "cairo"),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
          textTheme:
              GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme).apply(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            secondary: Colors.blue,
          ),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
