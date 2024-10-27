import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../weather/data/models/weather_model/weather_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, WeatherModel>> searchWeather(String query);
}
