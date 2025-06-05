import 'package:flutter/material.dart';
import 'package:quiz_app/views/quiz_screen.dart';

ListTile list(BuildContext context, String subjectName) {
  return ListTile(
    tileColor: const Color.fromARGB(255, 247, 169, 53),
    textColor: Colors.white,
    title: Text(subjectName),
    trailing: const Icon(Icons.arrow_forward, color: Colors.white),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(subjectName: subjectName),
        ),
      );
    },
  );
}
