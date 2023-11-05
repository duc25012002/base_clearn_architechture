import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/constant/constants.dart';
import 'package:weather_app/features/weather/presentations/views/routes/routes.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      backgroundColor: Colors.grey[100],
      width: SizeConfig.width! * 0.6,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: .4,
                    image: AssetImage("assets/bgr_nav_drawer.jpeg"),
                    fit: BoxFit.cover)),
            child: Text('Thái Nguyên\nWeather\'s App',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: SizeConfig.titlePx)),
          ),
          ListTile(
            title: Text('Home', style: TextStyle(fontSize: SizeConfig.descPx)),
            tileColor: Get.currentRoute == Routes.homeScreen
                ? Colors.amber[300]
                : Colors.white,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.homeScreen);
            },
          ),
          ListTile(
            title: Text('News', style: TextStyle(fontSize: SizeConfig.descPx)),
            tileColor: Get.currentRoute == Routes.newScreen
                ? Colors.amber[300]
                : Colors.white,
            onTap: () {
              Get.back();
              Get.offNamed(Routes.newScreen);
            },
          )
        ],
      ),
    );
  }
}
