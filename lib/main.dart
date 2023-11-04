import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:weather_app/translate/localization_service.dart';

Future<void> main() async {
  runApp(GetMaterialApp(
    navigatorKey: Get.key,
    debugShowCheckedModeBanner: false,
    // initialRoute: Routes.SPLASH,
    initialBinding: BindingsBuilder(() {
      // Khởi tạo và đặt bộ điều khiển vào bộ nhớ của GetX
    }),
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    defaultTransition: Transition.fade,
    initialRoute: Routes.homeScreen,
    getPages: getPages,
  ));
}
