import 'package:flutter/material.dart';

import 'package:u01_first_app/dice_roller.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomLeft;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  const GradientContainer.aquaPurple({super.key})
      : colors = const [
          Color.fromARGB(255, 18, 224, 197),
          Color.fromARGB(255, 73, 105, 248),
          Color.fromARGB(255, 166, 87, 255),
        ];

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
