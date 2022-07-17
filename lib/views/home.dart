import 'package:flutter/material.dart';
import 'package:newsapp/services/themeService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: const [
            Text("News"),
            Text("App",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
            ),)
          ],
        ),
      ),
      body: SingleChildScrollView(

      ),
    );
  }
}
