import 'package:flutter/material.dart';
import 'package:news_app/models/dummy_data.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/news_category_widget.dart';
class NewsCategoryScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App")
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        children: news_categories.map((cat) => NewsCategoryWidget(cat.id, cat.title, cat.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        )
      ),
    );
  }
}