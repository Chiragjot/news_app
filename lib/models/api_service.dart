import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

class ApiService{
  final index;
  ApiService(this.index);

  newsTypeDecider(){
    if (index == 0){
      final endPointUrl = "https://newsapi.org/v2/top-headlines?category=general&language=en&apiKey=27fbaed414824f32a778a835f185b208";
      return endPointUrl;
    }
    else if(index == 1){
      final endPointUrl = "https://newsapi.org/v2/top-headlines?category=sports&language=en&apiKey=27fbaed414824f32a778a835f185b208";
      return endPointUrl;
    }
    else if(index == 2){
      final endPointUrl = "https://newsapi.org/v2/top-headlines?country=in&language=en&apiKey=27fbaed414824f32a778a835f185b208";
      return endPointUrl;
    }

  }
  Future<List<Article>> getArticle() async{
    Response res = await get(Uri.parse(newsTypeDecider()));
    if (res.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      List<Article> articles = body.map((dynamic item) => Article.fromjson(item)).toList();
      return articles;
    }else {
      throw("can't get articles");
    }
  }
}