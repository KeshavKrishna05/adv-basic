import 'package:adv_basic/answer_button.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({
    super.key,
    required this.onAnswer,
  });
  void Function(String ans) onAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int ansindex = 0;
  int num = 0;
  void answernext(String ans) {
    widget.onAnswer(ans);
    setState(() {
      ansindex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[ansindex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentquestion.text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentquestion.suffled_ans().map((ans) {
            return AnswerButton(() {
              answernext(ans);
            }, ans);
          })
        ],
      ),
    );
  }
}
