import 'package:get/route_manager.dart';
import 'package:weather_app/features/weather/presentations/bindings/weather_controller_binding.dart';
import 'package:weather_app/features/weather/presentations/views/home_weather_page.dart';

class Routes {
  static String homeScreen = '/home';
  static String newScreen = '/new';
}

final getPages = [
  GetPage(
    name: Routes.homeScreen,
    page: () => HomeWeatherPage(),
    binding: WeatherControllerBinding(),
  ),
];
