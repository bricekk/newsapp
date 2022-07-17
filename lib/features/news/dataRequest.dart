import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newsapp/models/articleModel.dart';

class DataRequest {

  final urlEndPoint = "https://newsapi.org/v2/top-headlines?country=fr&apiKey=${dotenv.env["keyNewsApi"]}";

  Future<List<Article>> getArticle() async {
    try {
      var response = await Dio().get(urlEndPoint);
      List<dynamic> body = response.data["articles"];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } catch (e) {
      print(e);
      throw ("Can't get the articles");
    }
  }
}