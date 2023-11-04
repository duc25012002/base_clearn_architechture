import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/values/constants.dart';

class WeatherWeekController {
  Future<List<Weather>> getWeatherInWeek() async {
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
      List<Weather> weathers = [];
      final response = await http.get(Uri.parse(
          '$WEEK_URL?lat=${position.latitude}&lon=${position.longitude}&cnt=7&lang=vi&appid=apiKey'));
      if (response.statusCode == 200) {
        final data =
            jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
        for (var item in data['list']) {
          final weather = Weather.fromJson(item);
          weathers.add(weather);
        }
        return weathers;
      } else {
        throw Exception('Failed to get data');
      }
    } catch (exception) {
      print(exception.toString());
      throw Exception('Don\'t connect with server');
    }
  }
}
