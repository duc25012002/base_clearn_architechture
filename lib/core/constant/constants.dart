// ignore_for_file: constant_identifier_names, deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';

const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
const WEEK_URL = 'https://api.openweathermap.org/data/2.5/forecast/daily';
const apiKey = 'ad262c41936b6810e4ac5cc5ee2e13bf';
const newAPIs =
    'https://newsdata.io/api/1/news?apikey=pub_322642f987f8ed845dc6c5956530e98e844a2&q=technology&size=1&language=vi';
const realtimeDatabase = 'https://news-app-bfa39-default-rtdb.firebaseio.com/';

const cachedWeather = 'CACHED_WEATHER';

class SizeConfig {
  static MediaQueryData? mediaQueryData;
  static double? width;
  static double? height;
  static double? titlePx;
  static double? descPx;
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData!.size.width;
    height = mediaQueryData!.size.height;
    titlePx = width! * .045;
    descPx = height! * .02;
  }
}
