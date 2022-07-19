import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/components/articleTile.dart';
import 'package:newsapp/components/cardTile.dart';
import 'package:newsapp/models/articleModel.dart';
import 'package:newsapp/features/news/dataRequest.dart';
import 'package:newsapp/views/others/articleView.dart';

import '../services/themeService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<Article>> futureArticlesList = DataRequest().getArticles(url: endPoint);
  
  List categoriesUS = [
    "All",
    "Sport",
    "Entertainment",
    "Science",
    "Business",
    "Health",
    "technology"
  ];

  List categoriesFR = [
    "Toutes",
    "Sport",
    "Divertissement",
    "Science",
    "Affaire",
    "Sante",
    "technologie"
  ];

  int categoryIndex = 0;
  String endPoint = "https://newsapi.org/v2/top-headlines?country=us";

  @override
  void initState() {
    super.initState();
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20,top: 20,bottom: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(var i=0;i<categoriesUS.length;i++) GestureDetector(
                      onTap: (){
                        setState((){
                          categoryIndex = i;
                          if(categoriesUS[i].toString()!="All") {
                            endPoint = "$endPoint&category=${categoriesUS[i]
                                .toString()
                                .toLowerCase()}";
                          }else{
                            endPoint = "https://newsapi.org/v2/top-headlines?country=us";
                          }
                          futureArticlesList = DataRequest().getArticles(url: endPoint);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: (categoryIndex==i)?Colors.deepOrangeAccent:Colors.transparent, width: 2))
                        ),
                        child: Text(LangService().loadLangFromBox()?categoriesFR[i]:categoriesUS[i],
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 20,top: 10),
              child: Center(
                child: FutureBuilder(
                  future: futureArticlesList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Article>> snapshot){
                    if(snapshot.hasData){
                      List<Article> articles = snapshot.data!.sublist(0,5);
                      return Swiper(
                        layout: SwiperLayout.DEFAULT,
                        autoplayDelay: 5000,
                        autoplay: true,
                        itemCount: articles.length,
                        itemBuilder: (context,index){
                          Article article = articles[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> ArticleView(title: article.title, contentUrl: article.content??"", publishedAt: article.publishedAt??"", source: article.source.name, imgUrl: article.urlToImage??"",)));
                            },
                              child: CardTile(title: article.title, imgUrl: article.urlToImage??"", source: article.source.name));
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrangeAccent,
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 18,right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "last".tr,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  FutureBuilder(
                      future: futureArticlesList,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Article>> snapshot) {
                        if (snapshot.hasData) {
                          List<Article> articles = snapshot.data!.sublist(5);
                          return SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: articles.length,
                                itemBuilder: (context, index) {
                                  Article article = articles[index];
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=> ArticleView(title: article.title, contentUrl: article.content??"", publishedAt: article.publishedAt??"", source: article.source.name, imgUrl: article.urlToImage??"",)));
                                    },
                                    child: ArticleTile(
                                      title: article.title,
                                      imgUrl: article.urlToImage,
                                      source: article.source.name,
                                    ),
                                  );
                                },
                              ));
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepOrangeAccent,
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
