import 'package:dartz/dartz.dart';
import 'package:weather_app/core/connection/network_info.dart';
import 'package:weather_app/errors/exceptions.dart';
import 'package:weather_app/errors/failure.dart';
import 'package:weather_app/features/weather/business/entities/weather_entity.dart';
import 'package:weather_app/features/weather/business/respositories/weather_repository.dart';
import 'package:weather_app/features/weather/data/datasource/weather_local_data_source.dart';
import 'package:weather_app/features/weather/data/datasource/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherLocalDataSource weatherLocalDataSource;
  final WeatherRemoteDataSource weatherRemoteDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.weatherLocalDataSource,
    required this.weatherRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherEntity>> getWeather() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteWeather = await weatherRemoteDataSource.getWeather();
        weatherLocalDataSource.cacheWeather(remoteWeather);
        return Right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is ServerException'));
      }
    } else {
      try {
        final localWeather = await weatherLocalDataSource.getLastWeather();
        return Right(localWeather);
      } on ServerException {
        return Left(CacheFailure(errorMessage: 'No data not found'));
      }
    }
  }
}
