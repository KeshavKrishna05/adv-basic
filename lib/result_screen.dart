import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/question_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    super.key,
    required this.choosenAns,
    required this.restart,
  });
  void Function() restart;
  List<String> choosenAns;
  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAns.length; i++) {
      summary.add({
        'Question_Index': i,
        'Question': questions[i].text.characters,
        'Correct_Answer': questions[i].answer[0],
        'Your_Answer': choosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final int totalQ = questions.length;
    var summary = getsummarydata();
    final int correctQ = summary.where(
      (element) {
        return element['Correct_Answer'] == element['Your_Answer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have answered $correctQ questions out of $totalQ correctly',
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summary),
          OutlinedButton.icon(
            onPressed: restart,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 244, 148, 22),
                textStyle: const TextStyle(fontSize: 20)),
            icon: const Icon(Icons.refresh_sharp),
            label: const Text(
              'Reattempt',
            ),
          ),
        ],
      ),
    );
  }
}
