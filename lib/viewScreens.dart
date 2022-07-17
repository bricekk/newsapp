import 'package:flutter/material.dart';
import 'package:newsapp/views/bookMarkPage.dart';
import 'package:newsapp/views/home.dart';
import 'package:newsapp/views/searchPage.dart';
import 'package:newsapp/views/settingPage.dart';

class ViewScreens extends StatefulWidget {
  const ViewScreens({Key? key}) : super(key: key);

  @override
  State<ViewScreens> createState() => _ViewScreensState();
}

class _ViewScreensState extends State<ViewScreens> {

  List<Widget> widgetList = const [
    HomePage(),
    SearchPage(),
    BookMarkPage(),
    SettingPage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: widgetList[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        onTap: (int index){
          setState((){
            currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
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
