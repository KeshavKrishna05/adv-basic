import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/questions_screen.dart';
import 'package:adv_basic/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  int flag = 0;
  List<String> answered = [];
  @override
  void switchScreen() {
    setState(() {
      currentScreen = QuestionScreen(
        onAnswer: choosenAnswer,
      );
    });
  }

  void restart() {
    setState(() {
      currentScreen = StartScreen(switchScreen);
      answered = [];
    });
  }

  void choosenAnswer(ans) {
    answered.add(ans);
    if (answered.length == questions.length) {
      setState(() {
        currentScreen = ResultScreen(
          choosenAns: answered,
          restart: restart,
        );
      });
    }
  }

  @override
  Widget build(context) {
    if (flag == 0) {
      currentScreen = (StartScreen(switchScreen));
      flag = 1;
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 45, 236, 246),
                Color.fromARGB(255, 2, 81, 123)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
