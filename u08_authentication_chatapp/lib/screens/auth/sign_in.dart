import 'package:flutter/material.dart';
import 'package:u08_authentication_chatapp/widgets/sign_in/email_field.dart';
import 'package:u08_authentication_chatapp/widgets/sign_in/password_field.dart';
import 'package:u08_authentication_chatapp/widgets/sign_in/sign_up_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        width: 200,
        child: Image.asset('assets/images/chat.png'),
      ),
    );
  }

  Widget get _signInButton {
    return ElevatedButton(
      onPressed: _signInSubmit,
      child: const Text('Sign In'),
    );
  }

  void _signInSubmit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo,
            Container(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      EmailField(
                        emailController: _emailController,
                      ),
                      const SizedBox(height: 24),
                      PasswordField(
                        passwordController: _passwordController,
                      ),
                      const SizedBox(height: 48),
                      _signInButton,
                      const SizedBox(height: 6),
                      SignUpButton(
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
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
