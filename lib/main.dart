import 'package:flutter/material.dart';
import 'package:quiz_app/views/subject_list.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 238, 199, 25)
      ),
      home: const SubjectListScreen(),
    );
  }
}

// https://drive.google.com/file/d/1E4OgKWSrT7tktt8OqKUxU8s7tB7pgCx8/view