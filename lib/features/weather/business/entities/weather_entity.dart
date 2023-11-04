class WeatherEntity {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final int sunSet;
  final int sunRise;

  WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.sunSet,
    required this.sunRise,
  });
}
