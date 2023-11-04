import 'package:get/get.dart';

class WeatherWeekPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WeatherWeekPageBindings(), permanent: true);
  }
}
