import 'package:flutter/material.dart';
import 'package:u08_authentication_chatapp/themes/main_theme.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'password_field',
      child: Material(
        type: MaterialType.transparency,
        child: TextFormField(
          controller: widget.passwordController,
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
              return 'The password must be at least 8 characters long';
            }
            return null;
          },
        ),
      ),
    );
  }
}
