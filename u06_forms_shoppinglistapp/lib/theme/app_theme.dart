import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kSeedColor = Color.fromARGB(255, 252, 93, 152);

final kColorSchemeLight = ColorScheme.fromSeed(
  seedColor: kSeedColor,
  brightness: Brightness.light,
);

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: kSeedColor,
  brightness: Brightness.dark,
);

const kGradientColor = [
  Color.fromARGB(255, 252, 93, 152),
  Color.fromARGB(255, 250, 92, 127),
  Color.fromARGB(255, 252, 116, 101),
];

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: GoogleFonts.nunitoTextTheme().copyWith(
      titleLarge: TextStyle(fontSize: 20, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    ),
    colorScheme: kColorSchemeLight,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.nunitoTextTheme().copyWith(
      titleLarge: TextStyle(fontSize: 24, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    colorScheme: kColorSchemeDark,
    scaffoldBackgroundColor: kColorSchemeDark.primaryContainer,
  );

  static PreferredSizeWidget gradientAppBar(
      {required Widget title, List<Widget>? actions}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: kGradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBar(
          title: title,
          actions: actions,
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 4,
          shadowColor: Colors.black.withValues(alpha: 0.25),
        ),
      ),
    );
  }
}
