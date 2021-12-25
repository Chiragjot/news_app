import 'package:news_app/news_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetailScreen extends StatelessWidget {
  static const String route_name = "/news_details";
  final content = Get.arguments['content'];
  final title = Get.arguments['title'];
  final urlToImage = Get.arguments['urlToImage'];
  final publishedAt = Get.arguments['publishedAt'];
  final author = Get.arguments['author'];
  final url = Get.arguments['url'];
  final description = Get.arguments['description'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: fetchNews,
        // ),
        backgroundColor: Color.fromRGBO(237, 230, 214, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(237, 230, 214, 1),
          title: Text(
            "Details",
            style: TextStyle(
                fontFamily: 'News',
                fontSize: 35,
                letterSpacing: 5,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: NewsDetailWidget(
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content));
  }
}
