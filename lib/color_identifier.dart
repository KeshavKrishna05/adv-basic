import 'package:flutter/material.dart';

class ColorIdentifier extends StatelessWidget {
  ColorIdentifier(this.data, {super.key});
  Map<String, Object> data;
  @override
  Widget build(context) {
    var cr;
    if (data['Correct_Answer'] == data['Your_Answer']) {
      cr = const Color.fromARGB(255, 74, 201, 186);
    } else {
      cr = const Color.fromARGB(255, 148, 65, 199);
    }
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 10),
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: cr,
      ),
      child: Text(((data['Question_Index'] as int) + 1).toString()),
    );
  }
}
