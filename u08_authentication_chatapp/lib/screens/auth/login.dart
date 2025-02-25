import 'package:flutter/material.dart';
import 'package:u08_authentication_chatapp/screens/auth/signup.dart';
import 'package:u08_authentication_chatapp/themes/main_theme.dart';
import 'package:u08_authentication_chatapp/widgets/nav/slide_page_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.emailInitialText = '',
    this.passwordInitialText = '',
  });

  final String emailInitialText;
  final String passwordInitialText;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  late final FocusNode _passwordFocusNode;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() => setState(() {}));

    _emailController = TextEditingController(
      text: widget.emailInitialText,
    );
    _passwordController = TextEditingController(
      text: widget.passwordInitialText,
    );
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
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

  Widget get _emailField {
    return Hero(
      tag: 'email_field',
      child: Material(
        type: MaterialType.transparency,
        child: TextFormField(
          controller: _emailController,
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
          validator: (value) {
            if (value == null || value.trim().isEmpty || !value.contains('@')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget get _passwordField {
    return Hero(
      tag: 'password_field',
      child: Material(
        type: MaterialType.transparency,
        child: TextFormField(
          controller: _passwordController,
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
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter a password';
            } else if (value.trim().length < 8) {
              return 'The password should be longer than 8 characters';
            }
            return null;
          },
        ),
      ),
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
      onPressed: () {},
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

  void _onTapSignUp(context) async {
    Navigator.of(context).push(
      SlidePageRoute(
        child: SignUpScreen(
          emailInitialText: _emailController.text,
          passwordInitialText: _passwordController.text,
        ),
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
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    children: [
                      _emailField,
                      const SizedBox(height: 24),
                      _passwordField,
                      const SizedBox(height: 48),
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
