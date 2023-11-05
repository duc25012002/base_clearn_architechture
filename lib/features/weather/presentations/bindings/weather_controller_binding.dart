import 'package:get/get.dart';
import 'package:weather_app/features/weather/presentations/controllers/weather_controller.dart';

class WeatherControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(
        () => WeatherController(getWeather: Get.find()));
  }
}
