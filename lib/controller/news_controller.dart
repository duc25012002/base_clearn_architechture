import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/new_model.dart';
import 'package:weather_app/values/constants.dart';

class NewsController {
  Future<List<NewModel>> getNewsAPI() async {
    try {
      List<NewModel> news = [];
      final response = await http.get(Uri.parse(newAPIs));
      if (response.statusCode == 200) {
        final data =
            jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
        for (var item in data['results']) {
          final newModel = NewModel.fromJson(item);
          print(newModel.title);
          news.add(newModel);
        }
        return news;
      } else {
        throw Exception('Failed to get news');
      }
    } catch (exception) {
      print(exception.toString());
      throw Exception('Please try again');
    }
  }
}
