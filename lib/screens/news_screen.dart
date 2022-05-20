import 'package:flutter/material.dart';
import 'package:news_app/models/api_service.dart';
import 'package:news_app/models/article_model.dart';

import '../widgets/news_screen_widget.dart';

class NewsScreen extends StatelessWidget {
  final int pageIndex;
  NewsScreen(this.pageIndex);
  @override
  Widget build(BuildContext context) {
    final ApiService client = ApiService(pageIndex);
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        List article = snapshot.data;
        if (snapshot.hasData) {
          return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              padding: EdgeInsets.all(15),
              itemCount: article.length,
              itemBuilder: (context, i) {
                return NewsScreenWidget(
                  author: article[i].author,
                  title: article[i].title.toString(),
                  description: article[i].description.toString(),
                  url: article[i].url.toString(),
                  urlToImage: article[i].urlToImage,
                  publishedAt: DateTime.parse(article[i].publishedAt),
                  content: article[i].content.toString(),
                );
              });
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 5,
          ),
        );
      },
    );
  }
}
