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
          children: [
            Text("bookmark#black".tr),
            Text("bookmark#orange".tr,
            style: const TextStyle(
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
            children: [
               Text("nobook".tr,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: Colors.grey),textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              const Icon(Icons.bookmarks_outlined,size: 40,color:Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }
}
