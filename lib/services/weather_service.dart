import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final endPoint = "https://api.openweathermap.org/data/2.5/forecast";
  final apiKey = "13e512bb9594d5d7e292f42b97d8ca75";

  WeatherService(this.dio);

  Future<Map<String, dynamic>> getWeather({required String cityName}) async {
    Response response = await dio.get(
      endPoint,
      queryParameters: {
        "units": "metric",
        "q": cityName,
        "appid": apiKey,
      },
    );
    return response.data;
  }
}
