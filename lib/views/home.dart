import 'package:flutter/material.dart';
import 'package:newsapp/components/articleTile.dart';
import 'package:newsapp/models/articleModel.dart';
import 'package:newsapp/features/news/dataRequest.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> llist;

  @override
  void initState() {
    llist = DataRequest().getArticle();
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
        child: Container(
          margin: const EdgeInsets.only(top:30,left: 20,right: 20,bottom: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
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
                  future: llist,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Article>> snapshot) {
                    if (snapshot.hasData) {
                      List<Article> articles = snapshot.data!;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: articles.length,
                            itemBuilder: (context, index) => ArticleTile(
                                title: articles[index].title,
                                imgUrl: articles[index].urlToImage)),
                      );
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
      ),
    );
  }
}
