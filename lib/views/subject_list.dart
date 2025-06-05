import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/subject_widgets.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 169, 53),
        title: const Center(child: Text("Quiz App")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            list(context, "Chemistry"),
            const SizedBox(height: 20),
            list(context, "English"),
            const SizedBox(height: 20),
            list(context, "Physics"),
            const SizedBox(height: 20),
            list(context, "Maths"),
          ],
      ),
    ));
  }
}