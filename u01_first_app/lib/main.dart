import 'package:flutter/material.dart';

import 'package:u01_first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          [
            Color.fromARGB(255, 18, 224, 197),
            Color.fromARGB(255, 73, 105, 248),
            Color.fromARGB(255, 166, 87, 255),
          ],
        ),
      ),
    ),
  );
}
