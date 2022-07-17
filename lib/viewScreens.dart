import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';

class ViewScreens extends StatefulWidget {
  const ViewScreens({Key? key}) : super(key: key);

  @override
  State<ViewScreens> createState() => _ViewScreensState();
}

class _ViewScreensState extends State<ViewScreens> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(){
            _currentIndex = index;
          }
        },
        items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home),
            ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
