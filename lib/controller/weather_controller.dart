// ignore_for_file: avoid_print, constant_identifier_names

import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/values/constants.dart';

class WeatherService {
  Future<Weather> getWeather() async {
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
      print(response.request!.url);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to get weather');
      }
    } catch (exception) {
      print(exception.toString());
      throw Exception('Please try again');
    }
  }
}
