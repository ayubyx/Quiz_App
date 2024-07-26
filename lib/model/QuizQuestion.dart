
class QuizQuestion {
  late final String text;
  final List<String> answers;

  List<String> shuflledAnswers(){
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }

  QuizQuestion(this.text, this.answers);
}