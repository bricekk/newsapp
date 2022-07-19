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

  bool isFR = LangService().loadLangFromBox();

  updateLanguage(Locale locale) {Get.back();Get.updateLocale(locale);}

  bool value = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("setting".tr),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20,bottom: 10),
        child: Column(
          children: [
            Column(
              children: [
                _settingTile(param: "lang".tr, context: context, suffix: GestureDetector(
                    onTap:(){
                      LangService().switchLang();
                      updateLanguage(isFR?const Locale('en', 'US'):const Locale('fr', 'FR'));
                      setState((){
                        isFR = !isFR;
                      });
                      },
                    child: Text(isFR?"🇫🇷":"🇬🇧",style: const TextStyle(fontSize: 17),))),
                _settingTile( param: "themeMode".tr, context: context, suffix: GestureDetector( child: Switch( value: value, activeColor: Colors.deepOrangeAccent, onChanged: (bool val){ setState((){ value = !value;}); ThemeService().switchTheme();},),),),
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
    margin: const EdgeInsets.only(left: 18,right: 18),
    decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: (Theme.of(context).textTheme.headline4?.color)!,width: 1),
          left: BorderSide(color: (Theme.of(context).textTheme.headline4?.color)!,width: 1),
          right: BorderSide(color: (Theme.of(context).textTheme.headline4?.color)!,width: 1),
        )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(param,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500
        )),
        suffix??Container(),
      ],
    ),
  );
}
