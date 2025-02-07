import 'package:flutter/material.dart';

const kSeedColor = Color.fromARGB(255, 147, 229, 250);
const kSurfaceColor = Color.fromARGB(255, 42, 51, 59);

final kColorSchemeLight = ColorScheme.fromSeed(
  seedColor: kSeedColor,
  brightness: Brightness.light,
  surface: kSurfaceColor,
);

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: kSeedColor,
  brightness: Brightness.dark,
  surface: kSurfaceColor,
);

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: kColorSchemeLight,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: kColorSchemeDark,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
  );
}
