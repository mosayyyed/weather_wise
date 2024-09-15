import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_cubit/cubit/wether_cubit/wether_cubit.dart';

import '../cubit/wether_cubit/weather_states.dart';
import '../widgets/city_map_widget.dart';
import '../widgets/home_screen/home_app_bar.dart';
import '../widgets/location_widget.dart';
import '../widgets/summary_card.dart';
import '../widgets/toggle_buttons_widget.dart';
import '../widgets/weather_forecast_widget.dart';
import '../widgets/weather_info_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff000000),
              Color(0xff123597),
            ],
          ),
        ),
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoaded) {
              return CustomScrollView(
                slivers: [
                  const HomeAppBar(),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 32.0),
                        const LocationWidget(
                          city: "My location",
                        ),
                        const SizedBox(height: 16.0),
                        WeatherInfoWidget(
                          weatherModel: state.weatherModel,
                        ),
                        const SizedBox(height: 16.0),
                        const ToggleButtonsWidget(),
                        const SizedBox(height: 16.0),
                        const WeatherForecastWidget(),
                        const SizedBox(height: 16.0),
                        SummaryCard(
                          weatherModel: state.weatherModel,
                        ),
                        const SizedBox(height: 16.0),
                        const CityMapScreen(),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is WeatherError) {
              return Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white, fontSize: 32),
              );
            } else {
              return const CircularProgressIndicator(
                color: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }
}
