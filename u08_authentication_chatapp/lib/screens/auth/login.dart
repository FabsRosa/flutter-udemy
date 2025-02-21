import 'package:flutter/material.dart';
import 'package:u08_authentication_chatapp/screens/auth/signup.dart';
import 'package:u08_authentication_chatapp/themes/main_theme.dart';
import 'package:u08_authentication_chatapp/widgets/nav/slide_page_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Widget get _logo {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 00,
        left: 20,
        right: 20,
      ),
      width: 200,
      child: Image.asset('assets/images/chat.png'),
    );
  }

  Widget get _emailField {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(
          Icons.mail_lock_outlined,
          color: kGradient1Brighter,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
    );
  }

  Widget get _passwordField {
    return TextFormField(
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(
          Icons.lock_person_outlined,
          color: kGradient1Brighter,
        ),
        suffixIcon: _passwordFocusNode.hasFocus
            ? IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_rounded,
                  color: kGradient2Brighter,
                ),
                onPressed: () => setState(() {
                  _obscurePassword = !_obscurePassword;
                }),
              )
            : null,
      ),
      obscureText: _obscurePassword,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget get _signInButton {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Sign In'),
    );
  }

  Widget _signUpButton(context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => SignUpScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(color: Colors.white),
          ),
          Text(' Sign up.'),
        ],
      ),
    );
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
              color: kBackgroundColor,
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    children: [
                      _emailField,
                      const SizedBox(height: 24),
                      _passwordField,
                      const SizedBox(height: 64),
                      _signInButton,
                      const SizedBox(height: 6),
                      _signUpButton(context),
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
