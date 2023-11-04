import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/constant/constants.dart';
import 'package:weather_app/errors/exceptions.dart';
import 'package:weather_app/features/weather/data/model/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<void>? cacheWeather(WeatherModel weatherToCache);
  Future<WeatherModel> getLastWeather();
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherModel> getLastWeather() {
    final jsonString = sharedPreferences.getString(cachedWeather);
    if (jsonString != null) {
      return Future.value(WeatherModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>? cacheWeather(WeatherModel? weatherToCache) async {
    if (weatherToCache != null) {
      sharedPreferences.setString(
          cachedWeather, jsonEncode(weatherToCache.toJson()));
    } else {
      throw CacheException();
    }
  }
}
