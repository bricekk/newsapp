import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.grey.shade900,
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        iconTheme: IconThemeData(
            color: Colors.white,
        ),
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
    textTheme: const TextTheme(
      headline3: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
      headline2: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w900,
    )
    ),
    cardTheme: CardTheme(
      color: Colors.grey.shade800,
    ),
  );

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.grey.shade900
        ),
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
    textTheme: TextTheme(
      headline3: TextStyle(
        fontSize: 15,
        color: Colors.grey.shade900,
        fontWeight: FontWeight.w900,
      ),
      headline2: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w900,
      )
    ),
    cardTheme: CardTheme(
      color: Colors.grey.shade50,
    )
  );

}
