import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write((_key), isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() async {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    await _saveThemeToBox(!_loadThemeFromBox());
    print("ThemeMode: ${Get.isDarkMode ? "light" : "dark"}");
  }
}


// class LangService{
//   final _box = GetStorage();
//   final _key = 'isFR';
//
//   bool _loadLangFromBox() => _box.read(_key)??false;
//
//   _saveLangToBox(bool isFR) => _box.write((_key), isFR);
//
//   void switchLang() async {
//     await _saveLangToBox(!_loadLangFromBox());
//     print("App language: ${Get ? "EN" : "FR"}");
//   }
//
// }
