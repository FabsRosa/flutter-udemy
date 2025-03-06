import 'package:flutter/material.dart';
import 'package:u08_authentication_chatapp/screens/auth/sign_up.dart';
import 'package:u08_authentication_chatapp/widgets/nav/slide_page_route.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  void _onTapSignUp(BuildContext context) async {
    Navigator.of(context).push(
      SlidePageRoute(
        child: SignUpScreen(
          emailInitialText: emailController.text,
          passwordInitialText: passwordController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _onTapSignUp(context);
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
}
