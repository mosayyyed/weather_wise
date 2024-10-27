import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_cubit/scr/features/weather/presentation/manger/wether_cubit/wether_cubit.dart';

import '../../../manger/wether_cubit/weather_states.dart';
import '../basic_weather_info_widget/basic_weather_info.dart';
import '../city_map_widget.dart';
import '../header_widget.dart';
import '../location_widget.dart';
import '../toggle_buttons_widget.dart';
import '../weather_forecast_widget.dart';
import '../weather_info_widget.dart';
import '../weather_summary/summary_card.dart';
import '../wind_info_widget/wind_info_widget.dart';
import 'data_chart.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
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
                BasicWeatherInfoWidget(
                  weatherModel: state.weatherModel,
                ),
                WindInfoWidget(
                  weatherModel: state.weatherModel,
                ),
                SummaryCard(
                  weatherModel: state.weatherModel,
                ),
                const SizedBox(height: 16.0),
                const SectionHeader(
                  title: 'Daily Temp Data',
                  seeMore: 'View all',
                ),
                DataChart(
                  weatherModel: state.weatherModel,
                ),
                const SizedBox(height: 16.0),
                const SectionHeader(
                  title: 'City Overview',
                  seeMore: '',
                ),
                CityMapScreen(
                  latitude: state.weatherModel.city.coord.lat,
                  longitude: state.weatherModel.city.coord.lon,
                ),
                const SizedBox(height: 16.0),
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
            child: SizedBox(
              height: 500,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
