import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/weather/presentations/bindings/init_binding.dart';
import 'package:weather_app/features/weather/presentations/views/routes/routes.dart';
import 'package:weather_app/translate/localization_service.dart';

Future<void> main() async {
  runApp(GetMaterialApp(
    navigatorKey: Get.key,
    debugShowCheckedModeBanner: false,
    initialBinding: InitBindings(),
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    defaultTransition: Transition.fade,
    initialRoute: Routes.homeScreen,
    getPages: getPages,
  ));
}
