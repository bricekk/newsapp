import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/models/sourceModel.dart';

class ArticleView extends StatelessWidget {

  final String title;
  final String imgUrl;
  final String contentUrl;
  final String publishedAt;
  final String source;

  const ArticleView({Key? key,
    required this.title,
    required this.imgUrl,
    required this.contentUrl,
    required this.publishedAt,
    required this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: const [
            Text("News"),
            Text(
              "App",
              style: TextStyle(
                color: Colors.deepOrangeAccent,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  _imgBox(context: context,imgUrl: imgUrl),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipOval(
                        child: Material(
                          color: Colors.deepOrangeAccent, // Button color
                          child: InkWell(
                            splashColor: Theme.of(context).scaffoldBackgroundColor, // Splash color
                            onTap: () {},
                            child: SizedBox(width: 56, height: 56, child: Icon(Icons.bookmark)),
                          ),
                        ),
                      )
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.deepOrangeAccent,width: 4)),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(title,
                  style: Theme.of(context).textTheme.headline2?.copyWith(color: Get.isDarkMode?Colors.white:Colors.black),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _imgBox({required String imgUrl, required BuildContext context}){
    return Container(
      height: MediaQuery.of(context).size.height/4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imgUrl.length>9 ? (NetworkImage(imgUrl) as ImageProvider<Object>) : const AssetImage("assets/noImg.png"),
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
