import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u08_authentication_chatapp/screens/main_screen.dart';
import 'package:u08_authentication_chatapp/themes/main_theme.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Features',
      theme: MainTheme.darkTheme,
      home: MainScreen(),
    );
  }
}
