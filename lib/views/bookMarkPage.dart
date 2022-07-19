import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children:const [
            Text("Book"),
            Text("marks",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
            ),)
          ],
        ),
      ),
      body: _noBook(),
    );
  }

  _noBook(){
    return Container(
      margin: const EdgeInsets.all(18),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
               Text("Your bookmarks collection is empty",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: Colors.grey),textAlign: TextAlign.center,),
               SizedBox(height: 10,),
              Icon(Icons.bookmarks_outlined,size: 40,color:Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }
}
