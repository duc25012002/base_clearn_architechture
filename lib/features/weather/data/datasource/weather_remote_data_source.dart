import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/constant/constants.dart';
import 'package:weather_app/features/weather/data/model/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel?> getWeather();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<WeatherModel?> getWeather() async {
    // get permisstion from user
    LocationPermission permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // fetch the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    try {
      final response = await http.get(Uri.parse(
          '$BASE_URL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey'));
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to get weather');
      }
    } catch (exception) {
      throw Exception('Please try again');
    }
  }
}
