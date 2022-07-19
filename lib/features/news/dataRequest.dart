import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
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
      print(endPointUrl);
      throw ("Can't get the articles");
    }
  }

  ///Load the html body of the url target and return getElementsByTagName('article')[0].outerHtml;
  Future<String> scrapContent ({required String url}) async {
    var target = Uri.parse(url);
    var response = await http.get(target);
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      var contentString = document.getElementsByTagName('article')[0].outerHtml;
      return contentString;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return "erreur";
    }
  }

}