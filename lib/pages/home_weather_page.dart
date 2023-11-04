// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controller/home_weather_page_controller.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/translate/localization_service.dart';
import 'package:weather_app/utils/nav_drawer.dart';
import 'package:weather_app/values/constants.dart';

import 'package:get/get.dart';

class HomeWeatherPage extends GetView<HomeWeatherPageController> {
  final weatherService = WeatherService();
  Weather? weather;
  String selectedLang = LocalizationService.locale.languageCode;

  HomeWeatherPage({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: const NavDrawer(),
      body: FutureBuilder<Weather>(
        future: weatherService.getWeather(),
        builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.width! * .08)));
              } else {
                weather = snapshot.data!;
                return Center(
                  child: Stack(alignment: Alignment.center, children: [
                    Positioned(
                      top: SizeConfig.height! * 0.05,
                      left: SizeConfig.width! * .01,
                      child: IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.list)),
                    ),
                    Positioned(
                        top: SizeConfig.height! * 0.05,
                        right: SizeConfig.width! * .01,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Speed to talk'.tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: SizeConfig.width! * .03)),
                            IconButton(
                                onPressed: () {
                                  textToSpeed(
                                      weather!.cityName.tr,
                                      (weather!.temperature - 273.15).round(),
                                      weather!.mainCondition.tr);
                                },
                                icon: const Icon(Icons.volume_down_alt)),
                          ],
                        )),
                    Positioned(
                      top: SizeConfig.height! * 0.2,
                      child: Text(
                        weather?.cityName.tr ?? 'no response',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.width! * .1),
                      ),
                    ),
                    Align(
                        child: Lottie.asset(
                            getWeatherAnimation(weather?.mainCondition.tr))),
                    Positioned(
                      bottom: SizeConfig.height! * 0.25,
                      child: Text(
                          '${(weather!.temperature - 273.15).round()}°C'.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.width! * .05)),
                    ),
                    Positioned(
                      bottom: SizeConfig.height! * 0.2,
                      child: Text(weather?.mainCondition.tr ?? 'no response',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.width! * .065)),
                    ),
                    Positioned(
                      bottom: SizeConfig.height! * .03,
                      right: SizeConfig.width! * .03,
                      child: Text(
                          'Bình minh: ${convertDateTime(weather!.sunRise)}'.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.width! * .03)),
                    ),
                    Positioned(
                      bottom: SizeConfig.height! * .01,
                      right: SizeConfig.width! * .03,
                      child: Text(
                          'Hoàng hôn: ${convertDateTime(weather!.sunSet)}'.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.width! * .03)),
                    ),
                  ]),
                );
              }
          }
        },
      ),
    );
  }
}

textToSpeed(String city, int temp, String mainCondition) {
  final FlutterTts tts = FlutterTts();
  tts.setLanguage('vi');
  tts.setSpeechRate(0.5);
  tts.speak(
      'Nhiệt độ tại thành phố $city hiện tại là $temp độ C. $mainCondition');
}

convertDateTime(int time) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  print(DateFormat('dd/MM/yyyy, HH:mm').format(dateTime));
  return DateFormat('dd/MM/yyyy, HH:mm').format(dateTime);
}

getWeatherAnimation(String? mainCondition) {
  if (mainCondition == null) {
    return 'assets/sunny.json';
  }
  switch (mainCondition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/cloud.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'assets/rain.json';
    case 'thunderstorm':
      return 'assets/thunder.json';
    case 'clear':
      return 'assets/sunny.json';
    default:
      return 'assets/sunny.json';
  }
}
