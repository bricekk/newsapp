import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        titleTextStyle: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w900,
          color: Colors.white,
          fontSize: 25,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade800,
        selectedIconTheme: const IconThemeData(
          color: Colors.deepOrangeAccent,
        )
    ),
  );

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.ubuntu(
        fontWeight: FontWeight.w900,
        color: Colors.grey.shade900,
        fontSize: 25,
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade300,
      selectedIconTheme: const IconThemeData(
        color: Colors.deepOrangeAccent,
      )
    ),
  );

}
