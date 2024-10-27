import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_cubit/scr/features/weather/data/repository/weather_repo.dart';
import 'package:weather_app_cubit/scr/features/weather/presentation/manger/wether_cubit/weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  final WeatherRepo weatherRepo;

  GetWeatherCubit(this.weatherRepo) : super(WeatherInitial());

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoading());

    final weatherModel = await weatherRepo.getWeather(cityName: cityName);
    weatherModel.fold(
      (failure) {
        emit(WeatherError(failure.message));
      },
      (weather) {
        emit(WeatherSuccess(weather));
      },
    );
  }
}
