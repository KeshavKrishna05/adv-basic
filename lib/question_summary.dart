import 'package:adv_basic/color_identifier.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summary, {super.key});
  List<Map<String, Object>> summary;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            var cr;
            if (data['Correct_Answer'] == data['Your_Answer']) {
              cr = const Color.fromARGB(255, 74, 201, 186);
            } else {
              cr = const Color.fromARGB(255, 148, 65, 199);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColorIdentifier(data),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['Question'].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['Correct_Answer'].toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['Your_Answer'].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: cr,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
