import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

import '../models/article_model.dart';
import '../models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=870b8369da0f4bceb741666ceea670e9";

    var response = await http.get(url);
    var json = jsonDecode(response.body);

    if (json["status"] == "ok") {
      json["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            content: element["content"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class SpecificNews {
  List<ArticleModel> news = [];

  Future<void> getSpecificNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=870b8369da0f4bceb741666ceea670e9";

    var response = await http.get(url);
    var json = jsonDecode(response.body);

    if (json["status"] == "ok") {
      json["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            content: element["content"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
