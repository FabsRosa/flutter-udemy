import 'package:flutter/material.dart';
/* import 'package:flutter/services.dart'; */

import 'package:u04_interactivity/widgets/expenses.dart';

const kSeedColor = Color.fromARGB(255, 214, 255, 248);
// const kDarkSeedColor = Color.fromARGB(255, 5, 99, 125);
var kColorScheme = ColorScheme.fromSeed(
  seedColor: kSeedColor,
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: kSeedColor,
);

void main() {
  /* WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) { */
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: kDarkColorScheme.onSecondaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          color: kDarkColorScheme.secondaryContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        /* textTheme: ThemeData().textTheme.copyWith(
                bodyMedium: TextStyle(
                  color: Colors.white,
                ),
              ), */
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          foregroundColor: kColorScheme.onSecondaryContainer,
          backgroundColor: kColorScheme.secondaryContainer,
        ),
        scaffoldBackgroundColor: kColorScheme.secondaryContainer,
        cardTheme: CardTheme().copyWith(
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          // color: kColorScheme.secondaryContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        /* textTheme: ThemeData().textTheme.copyWith(
                bodyMedium: TextStyle(
                  color: Colors.black,
                ),
              ), */
      ),
      home: Expenses(),
    ),
  );
  /* }); */
}
