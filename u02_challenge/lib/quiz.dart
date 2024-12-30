import 'package:flutter/material.dart';

import 'package:u02_challenge/start_screen.dart';
import 'package:u02_challenge/questions_screen.dart';
import 'package:u02_challenge/results_screen.dart';
import 'package:u02_challenge/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget;

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
          onRestartQuiz: restartQuiz, selectedAnswers: selectedAnswers);
    } else {
      screenWidget = StartScreen(onStartQuiz: switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 80, 0, 184),
                Color.fromARGB(255, 118, 14, 207),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
