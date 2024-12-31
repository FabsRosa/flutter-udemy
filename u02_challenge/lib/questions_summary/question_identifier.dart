import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final int questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 95, 181, 142)
            : const Color.fromARGB(255, 218, 100, 180),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Center(
        child: Text(
          questionNumber.toString(),
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
