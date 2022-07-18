import 'package:flutter/material.dart';
import 'package:newsapp/components/searchBar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
          children: const [
            SearchBar()
          ],
        ),
      ),
    );
  }
}
