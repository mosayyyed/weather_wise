import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_cubit/cubit/wether_cubit/weather_states.dart';
import 'package:weather_app_cubit/cubit/wether_cubit/wether_cubit.dart';
import 'package:weather_app_cubit/widgets/city_map_widget.dart';
import 'package:weather_app_cubit/widgets/location_widget.dart';
import 'package:weather_app_cubit/widgets/summary_card.dart';
import 'package:weather_app_cubit/widgets/toggle_buttons_widget.dart';
import 'package:weather_app_cubit/widgets/weather_forecast_widget.dart';
import 'package:weather_app_cubit/widgets/weather_info_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 32.0),
                LocationWidget(
                  city: state.weatherModel.city.name,
                  country: state.weatherModel.city.country,
                ),
                const SizedBox(height: 16.0),
                WeatherInfoWidget(
                  weatherModel: state.weatherModel,
                ),
                const SizedBox(height: 16.0),
                const ToggleButtonsWidget(),
                const SizedBox(height: 16.0),
                WeatherForecastWidget(
                  weatherModel: state.weatherModel,
                ),
                const SizedBox(height: 16.0),
                SummaryCard(
                  weatherModel: state.weatherModel,
                ),
                const SizedBox(height: 16.0),
                const CityMapScreen(),
              ],
            ),
          );
        } else if (state is WeatherError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
