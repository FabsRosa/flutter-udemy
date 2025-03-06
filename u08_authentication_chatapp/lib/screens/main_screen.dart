import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:u08_authentication_chatapp/screens/auth/sign_in.dart';
import 'package:u08_authentication_chatapp/screens/chat/chat.dart';
import 'package:u08_authentication_chatapp/screens/splash.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }

        if (snapshot.hasData) {
          return ChatScreen();
        }

        return SignInScreen();
      },
    );
  }
}
