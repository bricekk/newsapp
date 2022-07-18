import "package:flutter/material.dart";
import 'package:newsapp/models/sourceModel.dart';

class ArticleView extends StatelessWidget {

  final String title;
  final String? imgUrl;
  final String contentUrl;
  final String publishedAt;
  final Source source;

  const ArticleView({Key? key,
    required this.title,
    this.imgUrl,
    required this.contentUrl,
    required this.publishedAt,
    required this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  _imgBox({String? imgUrl, required BuildContext context}){
    return Container(
      height: MediaQuery.of(context).size.height/4,
    );
  }
}
