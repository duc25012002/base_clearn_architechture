// Controller
// ignore_for_file: body_might_complete_normally_nullable

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:weather_app/features/weather/business/entities/weather_entity.dart';
import 'package:weather_app/features/weather/business/usecase/get_weather.dart';
import 'package:weather_app/features/weather/presentations/bindings/weather_controller_binding.dart';

class WeatherController extends GetxController {
  final GetWeather getWeather;
  final weather = Rx<WeatherEntity?>(null);

  WeatherController({required this.getWeather});

  Future<WeatherEntity?> getWeatherInPresent() async {
    final result = await getWeather.getWeatherInDay();
    result.fold((failure) => Get.snackbar('Error', failure.errorMessage),
        (data) => weather.value = data);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    WeatherControllerBinding().dependencies();
  }
}
