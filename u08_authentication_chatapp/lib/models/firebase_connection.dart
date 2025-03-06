import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class FirebaseConnection {
  static Future<UserCredential?> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredentials;
    } on FirebaseAuthException catch (error) {
      presentErrorOnSnackBar(
        scaffoldMessenger: scaffoldMessenger,
        error: error,
      );
      return null;
    }
  }

  static Future<UserCredential?> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      final userCredentials = await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredentials;
    } on FirebaseAuthException catch (error) {
      presentErrorOnSnackBar(
        scaffoldMessenger: scaffoldMessenger,
        error: error,
      );
      return null;
    }
  }

  static void presentErrorOnSnackBar({
    required ScaffoldMessengerState scaffoldMessenger,
    required FirebaseAuthException error,
  }) {
    scaffoldMessenger.clearSnackBars();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          error.message ?? 'Authentication failed.',
        ),
      ),
    );
  }
}
