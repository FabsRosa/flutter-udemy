import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    const fontSize = 17.0;

    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              Text(
                ((data['question_index'] as int) + 1).toString(),
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: fontSize,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data['question_text'] as String,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: fontSize,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data['user_answer'] as String,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: fontSize,
                      ),
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
