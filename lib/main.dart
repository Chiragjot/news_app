import 'package:flutter/material.dart';
import './screens/news_detail_screen.dart';
import 'package:get/get.dart';
import 'package:news_app/news_tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Headline',
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NewsTabs(),
      getPages: [
        GetPage(
          name: '/',
          page: () => NewsTabs(),
        ),
        GetPage(
          name: NewsDetailScreen.route_name,
          page: () => NewsDetailScreen(),
        ),
      ],
    );
  }
}