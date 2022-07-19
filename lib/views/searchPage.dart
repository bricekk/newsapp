import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/components/searchBar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List categoriesUS = [
    "All",
    "Sport",
    "Entertainment",
    "Science",
    "Business",
    "Health",
    "technology"
  ];

  int categoryIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(Icons.filter_list_alt,color: Colors.grey.shade900,),
        ),
      body: Container(
        margin: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Column(
          children:  [
            const SearchBar(),
            Container(
              margin: const EdgeInsets.only(top: 20,bottom: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(var i=0;i<categoriesUS.length;i++) GestureDetector(
                      onTap: (){
                        setState((){
                          categoryIndex = i;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.only(left: 12,right: 12,top: 2,bottom: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color: (categoryIndex==i)?Colors.deepOrangeAccent:Colors.grey.shade700,
                        ),
                        child: Text(categoriesUS[i],
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
            )
          ],
        ),
      ),
    );
  }
}
