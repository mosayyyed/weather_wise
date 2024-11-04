import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_service.dart';
import '../models/weather_model/weather_model.dart';
import 'weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  final ApiService _apiService;

  WeatherRepoImpl(this._apiService);

  @override
  Future<Either<Failure, WeatherModel>> getWeather({
    required String cityName,
  }) async {
    try {
      final response = await _apiService.get(
        url: '${ApiService.kBaseUrl}/forecast',
        queryParameters: {
          "q": cityName,
          "appid": "13e512bb9594d5d7e292f42b97d8ca75",
          "units": "metric",
        },
      );

      if (response.statusCode == 200) {
        final weatherModel = WeatherModel.fromJson(response.data);
        return Right(weatherModel);
      } else {
        final errorMessage =
            response.data['message'] ?? 'Failed to load weather data';
        return Left(ServerFailure(errorMessage));
      }
    } on DioException catch (error) {
      return Left(ServerFailure.fromDioException(error));
    }
  }
}
