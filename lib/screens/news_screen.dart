import 'package:flutter/material.dart';
import 'package:news_app/models/api_service.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/source_model.dart';
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
        List articles = snapshot.data;
        if (snapshot.hasData) {
          return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              padding: EdgeInsets.all(15),
              itemCount: articles.length,
              itemBuilder: (context, i) {
                return NewsScreenWidget(
                  author: articles[i].author,
                  title: articles[i].title.toString(),
                  description: articles[i].description.toString(),
                  url: articles[i].url.toString(),
                  urlToImage: articles[i].urlToImage,
                  publishedAt: DateTime.parse(articles[i].publishedAt),
                  content: articles[i].content.toString(),
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
