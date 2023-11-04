import 'package:get/route_manager.dart';
import 'package:weather_app/pages/news_page.dart';
import 'package:weather_app/pages/home_weather_page.dart';

class Routes {
  static String homeScreen = '/home';
  static String newScreen = '/new';
}

final getPages = [
  GetPage(name: Routes.homeScreen, page: () => HomeWeatherPage()),
  GetPage(name: Routes.newScreen, page: () => const NewsPage())
];
