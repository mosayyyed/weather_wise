import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_model/weather_model.dart';
import '../../services/weather_service.dart';
import 'weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(this.weatherService) : super(WeatherInitial());
  final WeatherService weatherService;

  Future getWeather({required String cityName}) async {
    emit(WeatherLoading());

    try {
      print("befor");
      final response = await weatherService.getWeather(cityName: cityName);
      WeatherModel weatherModel = WeatherModel.fromJson(response);

      emit(WeatherLoaded(weatherModel));
      print("after");
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
