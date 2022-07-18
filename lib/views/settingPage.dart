import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Settings"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20,bottom: 10),
        child: Column(
          children: [
            //🇬🇧
            Column(
              children: [
                _settingTile(param: "Region and languages", context: context, suffix: Text("🇫🇷")),
                _settingTile( param: "Dark mode", context: context, suffix: GestureDetector( child: Switch( value: value, activeColor: Colors.deepOrangeAccent, onChanged: (bool val){ setState((){ value = !value;}); ThemeService().switchTheme();},),),),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text("Made with ❤️ by Brice Kamhoua.",
                      style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 15),)
                    ],
                  ),
                ],
              ),
            )
            ],
        ),
      ),
    );
  }
}

_settingTile({required String param, Widget? suffix, required BuildContext context}){
  return Container(
    height: 50,
    padding: const EdgeInsets.only(left: 15,right: 18),
    decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: (Theme.of(context).textTheme.headline2?.color)!,width: 1),
        )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(param,
        style: GoogleFonts.roboto()),
        suffix??Container(),
      ],
    ),
  );
}
