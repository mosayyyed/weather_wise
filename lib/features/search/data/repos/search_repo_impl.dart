import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_service.dart';
import '../../../weather/data/models/weather_model/weather_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, WeatherModel>> searchWeather(String cityName) async {
    try {
      final response = await apiService.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        {
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
    } on Exception catch (error) {
      return Left(ServerFailure('An error occurred: ${error.toString()}'));
    }
  }
}
