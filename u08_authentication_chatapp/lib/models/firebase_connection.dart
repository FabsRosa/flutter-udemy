import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class FirebaseConnection {
  static Future<UserCredential?> signUp({
    required ScaffoldMessengerState scaffoldMessenger,
    required String email,
    required String password,
    required File selectedImage,
  }) async {
    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${userCredentials.user!.uid}.jpg');

      await storageRef.putFile(selectedImage);
      final imageUrl = await storageRef.getDownloadURL();

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
    required ScaffoldMessengerState scaffoldMessenger,
    required String email,
    required String password,
  }) async {
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
