import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/config/theme.dart';
import 'package:newsapp/services/themeService.dart';
import 'package:newsapp/viewScreens.dart';


Future<void> main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const ViewScreens(),
    );
  }
}
