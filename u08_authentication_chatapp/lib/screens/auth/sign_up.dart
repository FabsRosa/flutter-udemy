import 'dart:io';

import 'package:flutter/material.dart';
import 'package:u08_authentication_chatapp/themes/main_theme.dart';

import 'package:u08_authentication_chatapp/widgets/auth/email_field.dart';
import 'package:u08_authentication_chatapp/widgets/auth/password_field.dart';
import 'package:u08_authentication_chatapp/models/firebase_connection.dart';
import 'package:u08_authentication_chatapp/widgets/user_image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    this.emailInitialText = '',
    this.passwordInitialText = '',
  });

  final String emailInitialText;
  final String passwordInitialText;

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  File? _selectedImage;
  var _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(
      text: widget.emailInitialText,
    );
    _passwordController = TextEditingController(
      text: widget.passwordInitialText,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget get _signUpButton {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kGradient2Brighter,
      ),
      onPressed: _signUpSubmit,
      child: const Text('Sign Up'),
    );
  }

  void _signUpSubmit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    try {
      setState(() {
        _isAuthenticating = true;
      });

      _formKey.currentState!.save();
      await FirebaseConnection.signUp(
        scaffoldMessenger: ScaffoldMessenger.of(context),
        email: _emailController.text,
        password: _passwordController.text,
        selectedImage: _selectedImage!,
      );

      if (!mounted) return;
      await FirebaseConnection.signIn(
        scaffoldMessenger: ScaffoldMessenger.of(context),
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (!mounted) return;
      Navigator.of(context).pop();
    } catch (error) {
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  Widget get _bodyContent {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    UserImagePicker(
                      onPickedImage: ({required File pickedImage}) {
                        _selectedImage = pickedImage;
                      },
                    ),
                    const SizedBox(height: 24),
                    EmailField(
                      emailController: _emailController,
                      color: kGradient2Brighter,
                    ),
                    const SizedBox(height: 24),
                    PasswordField(
                      passwordController: _passwordController,
                      color: kGradient2Brighter,
                      eyeColor: kGradient1Brighter,
                    ),
                    const SizedBox(height: 48),
                    _signUpButton,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _loading {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text('Logging in'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: _isAuthenticating ? _loading : _bodyContent,
    );
  }
}
