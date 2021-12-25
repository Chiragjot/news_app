import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_detail_screen.dart';
import 'package:intl/intl.dart';

class NewsScreenWidget extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  NewsScreenWidget({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1),
      splashColor: Colors.lime,
      onTap: () {
                Get.toNamed(NewsDetailScreen.route_name, arguments: {
                  'content': content,
                  'title': title,
                  'urlToImage': urlToImage,
                  'publishedAt': publishedAt,
                  'author': author,
                  'url': url,
                  'description': description,
                },
              );},
      child: Container(
          // color: Colors.pink,
          // child: Text(urlToImage),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Card(
                elevation: 10,
                color: Color.fromRGBO(242, 238, 203, 1),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      urlToImage==null ? Image.asset('assets/image/maxresdefault.png')
                      : FadeInImage.assetNetwork(
                        fadeInDuration: const Duration(seconds: 3),
                        fadeInCurve: Curves.bounceIn,
                        placeholder: 'assets/image/maxresdefault.png',
                        image: urlToImage,
                        fit: BoxFit.cover ,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          title,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        child: author == null ? null 
                        : Text(
                          "author : "+author,
                          style: TextStyle(
                            fontSize: 18
                          ), 
                        )
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Posted on "+DateFormat('EEEE, d MMMM, yyyy').format(publishedAt)+" at "+DateFormat('h:mm a').format(publishedAt),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
    );
  }
}