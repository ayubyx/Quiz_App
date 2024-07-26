import 'package:flutter/material.dart';
import 'package:quiz_app_2/data/questions.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  List<String> selectedAnswers;
  void Function() restart;
  Result(this.selectedAnswers, this.restart, {super.key});

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'index': i,
        'question': questions[i].text,
        'user_answer': selectedAnswers[i],
        'correct_answer': questions[i].answers[0]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = summaryData;
    int numOfCorrectAnswer = summarydata
        .where((e) => e["user_answer"] == e["correct_answer"])
        .length;
    return Container(
        margin: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "You answered $numOfCorrectAnswer out of ${questions.length}  questions!!!",
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 80),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...summarydata.map(
                    (e) => Column(children: [
                      Row(children: [
                        CircleAvatar(
                          backgroundColor:
                              e["user_answer"] == e["correct_answer"]
                                  ? Colors.green
                                  : Colors.red,
                          radius: 16,
                          child: Text(
                            ((e['index'] as int) + 1).toString(),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['question'].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                e["user_answer"].toString(),
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Text(e["correct_answer"].toString(),
                                  style: const TextStyle(color: Colors.blue))
                            ],
                          ),
                        )
                      ]),
                      const SizedBox(height: 15),
                    ]),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 80),
          TextButton.icon(
            onPressed: restart,
            icon: const Icon(Icons.restart_alt_outlined),
            label: const Text("Restart Quiz"),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
          )
        ]));
  }
}
