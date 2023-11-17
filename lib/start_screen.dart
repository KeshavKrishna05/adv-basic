import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startquiz, {super.key});
  void Function() startquiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/download.jpeg',
            width: 200,
          ),
          const SizedBox(height: 30),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 247, 99, 148),
            ),
          ),
          const SizedBox(height: 32),
          OutlinedButton.icon(
            onPressed: startquiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.arrow_circle_right_sharp),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
