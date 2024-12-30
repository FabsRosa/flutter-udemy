import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:u02_challenge/data/questions.dart';
import 'package:u02_challenge/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onRestartQuiz,
    required this.selectedAnswers,
  });

  final void Function() onRestartQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question_text': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered \$number out of \$number questions correctly!',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(height: 40),
            OutlinedButton.icon(
              onPressed: onRestartQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: Text(
                'Restart quiz',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
