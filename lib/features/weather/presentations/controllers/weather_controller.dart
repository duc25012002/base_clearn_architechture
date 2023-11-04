// Controller
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:weather_app/features/weather/business/usecase/get_weather.dart';

class WeatherController extends GetxController {
  final GetWeather getWeather;

  WeatherController({required this.getWeather});

  Future<void> getWeatherInPresent() async {
    final result = await getWeather.getWeatherInDay();
    result.fold((l) => Get.snackbar('Error', l.errorMessage),
        (r) => Get.snackbar('Weather Notification', 'Success!'));
  }
}
  