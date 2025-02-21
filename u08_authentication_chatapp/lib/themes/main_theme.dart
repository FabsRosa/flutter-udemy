import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kSeedColor = Color.fromARGB(255, 99, 150, 255);
const kSeedColorBrighter = Color.fromARGB(255, 183, 207, 255);
const kGradient1 = Color.fromARGB(255, 124, 255, 207);
const kGradient1Brighter = Color.fromARGB(255, 182, 255, 228);
const kGradient2 = Color.fromARGB(255, 167, 102, 255);
const kGradient2Brighter = Color.fromARGB(255, 214, 184, 255);
const kBackgroundColor = Color.fromARGB(255, 18, 18, 18);

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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kColorSchemeDark.primary),
        foregroundColor: WidgetStateProperty.all(kColorSchemeDark.onPrimary),
      ),
    ),
    colorScheme: kColorSchemeDark,
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kBackgroundColor,
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
