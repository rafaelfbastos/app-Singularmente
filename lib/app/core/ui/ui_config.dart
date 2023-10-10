import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme => ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00DDB3)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 22, 93, 80),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromARGB(255, 136, 136, 136),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  static String get appTitle => "Saúde Mental";
}
