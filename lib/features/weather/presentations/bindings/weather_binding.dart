import 'package:get/get.dart';
import 'package:weather_app/controller/home_weather_page_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeWeatherPageController(), permanent: true);
  }
}