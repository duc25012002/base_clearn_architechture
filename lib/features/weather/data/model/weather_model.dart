import 'package:weather_app/features/weather/business/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.cityName,
    required super.temperature,
    required super.mainCondition,
    required super.sunSet,
    required super.sunRise,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      sunRise: json['sys']['sunrise'].toInt(),
      sunSet: json['sys']['sunset'].toInt(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'temperature': temperature,
      'mainCondition': mainCondition,
      'sunRise': sunRise,
      'sunSet': sunSet,
    };
  }
}
