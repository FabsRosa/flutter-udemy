import 'package:flutter/material.dart';
import 'package:u08_authentication_chatapp/themes/main_theme.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'email_field',
      child: Material(
        type: MaterialType.transparency,
        child: TextFormField(
          controller: emailController,
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
            if (value == null || value.trim().isEmpty) {
              return 'Please enter an email address';
            } else if (!value.contains('@')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
      ),
    );
  }
}
