import 'package:flutter/material.dart';
import 'package:news_app/models/api_service.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_screen_widget.dart';

class NewsScreen extends StatefulWidget {
  final int pageIndex;
  NewsScreen(this.pageIndex);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final ApiService client = ApiService(widget.pageIndex);
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        var article = snapshot.data;
        if (article == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var datalength = article.length;
          if (datalength == 0) {
            return const Center(
              child: Text('Debug: No data found/ prob with API most likely'),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              padding: EdgeInsets.all(15),
              itemCount: datalength,
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
              },
            );
          }
        }
        // if (snapshot.hasData) {
        //   List<Article>? articles = snapshot.data;
        //   return ListView.separated(
        //       separatorBuilder: (context, index) {
        //         return SizedBox(
        //           height: 10,
        //         );
        //       },
        //       padding: EdgeInsets.all(15),
        //       itemCount: articles!.length,
        //       itemBuilder: (context, i) {
        //         return NewsScreenWidget(
        //           author: articles[i].author,
        //           title: articles[i].title.toString(),
        //           description: articles[i].description.toString(),
        //           url: articles[i].url.toString(),
        //           urlToImage: articles[i].urlToImage,
        //           publishedAt: DateTime.parse(articles[i].publishedAt),
        //           content: articles[i].content.toString(),
        //         );
        //       });
        // }
        // return Center(
        //   child: CircularProgressIndicator(
        //     color: Colors.black,
        //     strokeWidth: 5,
        //   ),
        // );
      },
    );
  }
}
