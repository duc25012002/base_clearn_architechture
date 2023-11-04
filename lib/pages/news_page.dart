import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/new_page_controller.dart';
import 'package:weather_app/controller/news_controller.dart';
import 'package:weather_app/models/new_model.dart';
import 'package:weather_app/utils/nav_drawer.dart';
import 'package:weather_app/values/constants.dart';

class NewsPage extends GetView<NewsPageController> {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = NewsController();
    return Scaffold(
      drawer: const NavDrawer(),
      body: FutureBuilder<List<NewModel>>(
        future: newsController.getNewsAPI(),
        builder:
            (BuildContext context, AsyncSnapshot<List<NewModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.width! * .08)));
              } else {
                final news = snapshot.data!;

                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: SizeConfig.height! * 0.05,
                        left: SizeConfig.width! * .01,
                        child: IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(Icons.list)),
                      ),
                      ListView.builder(
                          itemCount: news.length,
                          itemBuilder: (context, index) {
                            final newModel = news[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  SizedBox(height: SizeConfig.height! * 0.1),
                                  Text(
                                    newModel.title,
                                    style:
                                        TextStyle(fontSize: SizeConfig.titlePx),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    newModel.description,
                                    style:
                                        TextStyle(fontSize: SizeConfig.descPx),
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    newModel.content,
                                    style:
                                        TextStyle(fontSize: SizeConfig.descPx),
                                  ),
                                ],
                              ),
                            );
                          }),
                      Positioned(
                          top: SizeConfig.height! * 0.05,
                          right: SizeConfig.width! * .01,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Speed to talk'.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.width! * .03)),
                              IconButton(
                                  onPressed: () {
                                    for (var newOne in news) {
                                      textToSpeed(newOne.title,
                                          newOne.description, newOne.content);
                                    }
                                  },
                                  icon: const Icon(Icons.volume_down_alt)),
                            ],
                          )),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }

  textToSpeed(String title, String desc, String content) async {
    final FlutterTts tts = FlutterTts();
    tts.setLanguage('vi');
    tts.setSpeechRate(0.5);
    tts.speak('$title');
    tts.speak('$desc');
    final List<String> paragraphs = content.split('.');
    for (final paragraph in paragraphs) {
      tts.speak(paragraph);
      await Future.delayed(const Duration(seconds: 1));
    }
    tts.speak('Đã hết bài viết');
  }
}
