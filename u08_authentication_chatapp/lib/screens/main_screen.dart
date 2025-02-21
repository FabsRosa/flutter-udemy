import 'package:flutter/material.dart';

import 'package:u08_authentication_chatapp/screens/auth/login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
