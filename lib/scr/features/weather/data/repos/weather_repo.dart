import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/weather_model/weather_model.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherModel>> getWeather({required String cityName});
}
