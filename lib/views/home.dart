import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/components/articleTile.dart';
import 'package:newsapp/components/cardTile.dart';
import 'package:newsapp/models/articleModel.dart';
import 'package:newsapp/features/news/dataRequest.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> futureArticlesList;

  @override
  void initState() {
    futureArticlesList = DataRequest().getArticle();
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
              height: MediaQuery.of(context).size.height /4,
              margin: const EdgeInsets.only(bottom: 20,top: 10),
              child: Center(
                child: FutureBuilder(
                  future: futureArticlesList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Article>> snapshot){
                    if(snapshot.hasData){
                      List<Article> articles = snapshot.data!;
                      return Swiper(
                        layout: SwiperLayout.DEFAULT,
                        autoplayDelay: 3000,
                        autoplay: true,
                        itemCount: articles.length,
                        itemBuilder: (context,index){
                          Article article = articles[index];
                          return CardTile(title: article.title, imgUrl: article.urlToImage??"", source: article.source.name);
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
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Latest news",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  FutureBuilder(
                      future: futureArticlesList,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Article>> snapshot) {
                        if (snapshot.hasData) {
                          List<Article> articles = snapshot.data!;
                          return SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: articles.length,
                                itemBuilder: (context, index) {
                                  Article article = articles[index];
                                  return ArticleTile(
                                    title: article.title,
                                    imgUrl: article.urlToImage,
                                    source: article.source.name,
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
