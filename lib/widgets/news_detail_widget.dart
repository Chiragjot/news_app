import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class NewsDetailWidget extends StatelessWidget {

  final author;
  final title;
  final description;
  final url;
  final urlToImage;
  final publishedAt;
  final content;

  NewsDetailWidget({
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.urlToImage,
    @required this.publishedAt,
    @required this.content,
  });

    launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'cannot open $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'Headline',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: urlToImage == null
                  ? Image.asset('assets/image/maxresdefault.png')
                  : FadeInImage.assetNetwork(
                      fadeInDuration: const Duration(seconds: 3),
                      fadeInCurve: Curves.bounceIn,
                      placeholder: 'assets/image/maxresdefault.png',
                      image: urlToImage,
                      fit: BoxFit.cover,
                    ),
            ),
            Divider(color: Colors.black),
            Container(
                width: double.infinity,
                child: author == null
                    ? null
                    : Text(
                        "posted by " + author,
                        style: TextStyle(fontSize: 18),
                      )),
            Container(
              width: double.infinity,
              child: Text("on " +
                  DateFormat('EEEE, d MMMM, yyyy').format(publishedAt) +
                  " at " +
                  DateFormat('h:mm a').format(publishedAt)),
            ),
            Divider(color: Colors.black),
            Container(
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: content == 'null' ? null 
                    : content.substring(1, content.length - 14) + " . . .",
                    style: TextStyle(
                      fontFamily: 'Headline',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                      text: 'read more',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Headline',
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = launchURL)
                ]),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
