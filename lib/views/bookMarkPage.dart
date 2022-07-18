import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
