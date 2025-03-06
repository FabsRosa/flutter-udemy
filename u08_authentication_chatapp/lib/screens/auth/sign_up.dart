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

  Widget get _logo {
    return Hero(
      tag: 'main_logo',
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 00,
          left: 20,
          right: 20,
        ),
        width: 140,
        child: Image.asset('assets/images/chat.png'),
      ),
    );
  }

  Widget get _signUpButton {
    return ElevatedButton(
      onPressed: _signUpSubmit,
      child: const Text('Sign Up'),
    );
  }

  void _signUpSubmit() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      await FirebaseConnection.signUp(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
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
                      UserImagePicker(),
                      const SizedBox(height: 24),
                      EmailField(
                          emailController: _emailController,
                          color: kGradient2Brighter),
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
      ),
    );
  }
}
