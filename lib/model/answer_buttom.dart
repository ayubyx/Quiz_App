import 'package:flutter/material.dart';

class AnswerButtom extends StatelessWidget {
  final Function() onPressed;
  final String answer;
  const AnswerButtom(this.onPressed, this.answer, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 103, 58, 183),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(answer),
    );
  }
}
