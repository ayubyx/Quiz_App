import 'package:flutter/material.dart';
import 'package:quiz_app_2/data/questions.dart';
import 'package:quiz_app_2/model/answer_buttom.dart';

// ignore: must_be_immutable
class Question extends StatefulWidget {
  void Function(String) onSelected;
   Question(this.onSelected,{super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {

  var currentQuetionIndex = 0;
  
  void nextQuestion(String answer) {
    widget.onSelected(answer);
    setState(() {
      currentQuetionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuetion = questions[currentQuetionIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentQuetion.text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        // QUESTION!
        ...currentQuetion.shuflledAnswers().map((e) => Container(
            margin: const EdgeInsets.all(10),
            child: AnswerButtom(() => nextQuestion(e), e)))
      ],
    );
  }
}
