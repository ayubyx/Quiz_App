import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app_2/data/questions.dart';
import 'package:quiz_app_2/home.dart';
import 'package:quiz_app_2/question.dart';
import 'package:quiz_app_2/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void addUserAnswer(String answer) {
    selectedAnswers.add(answer);
    log(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Result(selectedAnswers, restartQuiz);
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = Home(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = Question(addUserAnswer);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurpleAccent])),
          child: activeScreen),
    );
  }
}
