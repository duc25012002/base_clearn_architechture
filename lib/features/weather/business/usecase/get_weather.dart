import 'package:dartz/dartz.dart';
import 'package:weather_app/errors/failure.dart';
import 'package:weather_app/features/weather/business/entities/weather_entity.dart';
import 'package:weather_app/features/weather/business/respositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository weatherRepository;

  GetWeather({required this.weatherRepository});
  Future<Either<Failure, WeatherEntity>> getWeatherInDay() async {
    return await weatherRepository.getWeather();
  }
}
