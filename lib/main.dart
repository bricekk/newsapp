import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/config/LocaleString.dart';
import 'package:newsapp/config/theme.dart';
import 'package:newsapp/services/themeService.dart';
import 'package:newsapp/viewScreens.dart';


Future<void> main() async{
  HttpOverrides.global = MyHttpOverrides(); //do not mess bro, only for development mode
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const MyApp());
  bool isFR = LangService().loadLangFromBox();
  updateLanguage(isFR?const Locale('en', 'US'):const Locale('fr', 'FR'));
}

void updateLanguage(Locale locale) {
  Get.back();Get.updateLocale(locale);
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fr_FR'),
      translations: LocaleString(),
      themeMode: ThemeService().theme,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const ViewScreens(),
    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}