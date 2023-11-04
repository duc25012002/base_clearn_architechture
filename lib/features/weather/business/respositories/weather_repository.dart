import 'package:dartz/dartz.dart';
import 'package:weather_app/errors/failure.dart';
import 'package:weather_app/features/weather/business/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather();
}
