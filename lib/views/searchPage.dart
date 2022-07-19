import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/components/searchBar.dart';

import '../components/articleTile.dart';
import '../features/news/dataRequest.dart';
import '../models/articleModel.dart';
import '../services/themeService.dart';
import 'others/articleView.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(Icons.filter_list_alt,color: Colors.grey.shade900,),
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Column(
            children:  [
            Container(
            height: 35,
            decoration: const BoxDecoration(),
            child:  TextField(
              cursorHeight: 21,
              cursorColor: Colors.grey,
              onChanged: (text){
                setState((){
                  categoryIndex = 0;
                  if(text.isNotEmpty){
                    endPoint = "https://newsapi.org/v2/everything?q=$text";
                    futureArticlesList = DataRequest().getArticles(url: endPoint);
                  }
                });
              },
              decoration: InputDecoration(
                  hintText: "search".tr,
                  suffixIcon: MaterialButton(
                      minWidth: 20,
                      onPressed: (){/*The keyboard should disappear*/},
                      child:  Icon(Icons.search,color: Theme.of(context).textTheme.headline4?.color)),
                  contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: (Theme.of(context).textTheme.headline4?.color)!,width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: (Theme.of(context).textTheme.headline4?.color)! ,width: 2)
                  )
              ),
            ),
          ),
              Container(
                margin: const EdgeInsets.only(top: 20,bottom: 10),
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
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.only(left: 12,right: 12,top: 2,bottom: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                              color: (categoryIndex==i)?Colors.deepOrangeAccent:Colors.grey.shade700,
                          ),
                          child: Text(LangService().loadLangFromBox()?categoriesFR[i]:categoriesUS[i],
                            style:  TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.grey.shade200,
                            ),),
                        ),
                      )
                    ],
                  ),
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
                    return  Container(
                      margin: const EdgeInsets.only(top: 100),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
