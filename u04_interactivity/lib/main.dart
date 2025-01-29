import 'package:flutter/material.dart';

import 'package:u04_interactivity/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 214, 255, 248),
);
void main() {
  runApp(
    MaterialApp(
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
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 32,
            fontFamily: 'nunito',
          ),
        ), */
      ),
      home: Expenses(),
    ),
  );
}
