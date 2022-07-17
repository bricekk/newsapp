import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/services/themeService.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool value = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Switch(
          value: value,
          activeColor: Colors.deepOrangeAccent,
          onChanged: (bool val){
            setState((){
              value = !value;
            });
            ThemeService().switchTheme();
          },
        ),
      ),
    );
  }
}
