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
    return Center(
      child: GestureDetector(
          onTap:(){ThemeService().switchTheme();},
          child: Icon(Icons.sunny,size: 50,color: Colors.white,
          )
      )
    );
  }
}
