// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final int sunSet;
  final int sunRise;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.sunSet,
    required this.sunRise,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      sunRise: json['sys']['sunrise'].toInt(),
      sunSet: json['sys']['sunset'].toInt(),
    );
  }
}
