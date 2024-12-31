import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:u02_challenge/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    const questionFontSize = 19.0;
    const answerFontSize = 17.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question_text'] as String,
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: questionFontSize,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.nunito(
                  color: const Color.fromARGB(255, 134, 255, 200),
                  fontSize: answerFontSize,
                ),
              ),
              if (!isCorrectAnswer)
                Text(
                  itemData['user_answer'] as String,
                  style: GoogleFonts.nunito(
                    color: const Color.fromARGB(255, 255, 119, 212),
                    fontSize: answerFontSize,
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }
}
