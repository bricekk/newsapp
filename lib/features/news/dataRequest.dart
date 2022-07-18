import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newsapp/models/articleModel.dart';

class DataRequest {

  Future<List<Article>> getArticles({required String url}) async {

    String endPointUrl = "${url}&apiKey=${dotenv.env["keyNewsApi"]}";

    try {
      var response = await Dio().get(endPointUrl);
      List<dynamic> body = response.data["articles"];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } catch (e) {
      print(e);
      throw ("Can't get the articles");
    }
  }

}