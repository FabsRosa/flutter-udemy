import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kSeedColor = Color.fromARGB(255, 18, 18, 18);

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: kSeedColor,
  brightness: Brightness.dark,
);

const kGradientColor = [
  Color.fromARGB(255, 0, 0, 0),
  Color.fromARGB(255, 15, 15, 15),
  Color.fromARGB(255, 30, 30, 30),
];

class MainTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.nunitoTextTheme().copyWith(
      titleLarge: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    colorScheme: kColorSchemeDark,
    scaffoldBackgroundColor: kSeedColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kSeedColor,
      foregroundColor: Colors.white,
    ),
  );

  static PreferredSizeWidget gradientAppBar(
      {required Widget title, List<Widget>? actions}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: kGradientColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AppBar(
          title: title,
          actions: actions,
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
