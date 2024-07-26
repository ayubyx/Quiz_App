import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final void Function() switchScreen;
  const Home(this.switchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 250,
          color: Colors.white.withOpacity(0.7),
        ),
        const SizedBox(height: 80),
        Text("Learn Flutter!",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white.withOpacity(0.7),
            )),
        const SizedBox(height: 80),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white.withOpacity(0.7),
                backgroundColor: Colors.deepPurpleAccent),
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text("Start Quiz!"))
      ],
    );
  }
}
