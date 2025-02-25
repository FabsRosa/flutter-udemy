import 'package:flutter/material.dart';
import 'package:u08_authentication_chatapp/themes/main_theme.dart';

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
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;
  late FocusNode _passwordFocusNode;
  late FocusNode _repeatPasswordFocusNode;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() => setState(() {}));
    _repeatPasswordFocusNode = FocusNode();
    _repeatPasswordFocusNode.addListener(() => setState(() {}));

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
    _repeatPasswordFocusNode.dispose();
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
        ),
      ),
    );
  }

  Widget get _repeatEmailField {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Repeat Email',
        prefixIcon: Icon(
          Icons.mail_lock_outlined,
          color: kSeedColorBrighter,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
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
        ),
      ),
    );
  }

  Widget get _repeatPasswordField {
    return TextFormField(
      focusNode: _repeatPasswordFocusNode,
      decoration: InputDecoration(
        labelText: 'Repeat Password',
        prefixIcon: const Icon(
          Icons.lock_person_outlined,
          color: kSeedColorBrighter,
        ),
        suffixIcon: _repeatPasswordFocusNode.hasFocus
            ? IconButton(
                icon: Icon(
                  _obscureRepeatPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_rounded,
                  color: kGradient2Brighter,
                ),
                onPressed: () => setState(() {
                  _obscureRepeatPassword = !_obscureRepeatPassword;
                }),
              )
            : null,
      ),
      obscureText: _obscureRepeatPassword,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget get _signUpButton {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Sign Up'),
    );
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
            _logo,
            Container(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    children: [
                      _emailField,
                      const SizedBox(height: 12),
                      _repeatEmailField,
                      const SizedBox(height: 24),
                      _passwordField,
                      const SizedBox(height: 12),
                      _repeatPasswordField,
                      const SizedBox(height: 48),
                      _signUpButton,
                      const SizedBox(height: 6),
                      // _signUpButton(context),
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
