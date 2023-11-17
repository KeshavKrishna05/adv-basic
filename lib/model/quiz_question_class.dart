class QuizQuestion {
  const QuizQuestion(this.text, this.answer);
  final String text;
  final List<String> answer;
  List<String> suffled_ans() {
    final suffled_list = List.of(answer);
    suffled_list.shuffle();
    return suffled_list;
  }
}
