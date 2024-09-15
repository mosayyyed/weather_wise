import 'package:dio/dio.dart';

import '../models/weather_model/forecast_model.dart';

class WeatherService {
  final Dio dio;
  final endPoint = "https://api.openweathermap.org/data/2.5/forecast";
  final apiKey = "13e512bb9594d5d7e292f42b97d8ca75";

  WeatherService(this.dio);

  Future<Map<String, dynamic>> getWeather({required String cityName}) async {
    print("befor");
    Response response = await dio.get(
      endPoint,
      queryParameters: {
        "units": "metric",
        "q": cityName,
        "appid": apiKey,
      },
    );
    print("after");
    print(response.data);
    return response.data;
  }

  Future<Forecast> getForecast({required String cityName}) async {
    try {
      Response response = await dio.get(
        endPoint,
        queryParameters: {
          "q": cityName,
          "appid": apiKey,
        },
      );
      Forecast forecast = Forecast.fromJson(response.data);
      return forecast;
    } catch (e) {
      throw e;
    }
  }
}
