import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/views/subject_list.dart';

class ResultScreen extends StatelessWidget {

  final int userPercentage;
  final int totalRight;
  final int wrongQ;
  final int ommitedQuestion;

  const ResultScreen({super.key, required this.ommitedQuestion, required this.totalRight, required this.userPercentage, required this.wrongQ});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Your Result"),
        ),
        body: Column(
            children: [
          const SizedBox(
                height: 20,
            ),
            Column(
                children: [
                Text(
                    userPercentage < 50
                        ? "Try Again"
                        : userPercentage >= 50 && userPercentage <= 99
                            ? "You have Passed"
                            : "Perfect Score ",
                    style: TextStyle(
                        fontFamily: 'TanseekModernProArabic',
                        fontSize: 22,
                        letterSpacing: 1,
                        color: userPercentage < 50 ? Colors.red : Colors.blue,
                        fontWeight: FontWeight.bold),
                ),
              const SizedBox(
                    height: 10,
                ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 8.0,
                    animation: true,
                    percent: userPercentage / 100,
                    center: Text(
                        '  $userPercentage% ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'TanseekModernProArabic',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: userPercentage < 60
                            ? Colors.red
                            : const Color(0xFF437B85),
                      ),
                    ),
        circularStrokeCap: CircularStrokeCap.round,
            progressColor: userPercentage < 60
                ? Colors.red
                : const Color(0xFF437B85),
                    backgroundColor: const Color(0xFFE8914F),
                  ),
                ],
              ),
        const SizedBox(
            height: 10,
        ),
            Text(
                'Your Final Result is $userPercentage%',
                style: TextStyle(
                    fontFamily: 'TanseekModernProArabic',
                    fontSize: 22,
                    color: userPercentage < 50 ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold,
                ),
            ),
              const SizedBox(
                height: 5,
            ),
            ],
          ),
        const SizedBox(
            height: 20,
        ),
            Text(
                "Total Right Answers : $totalRight",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        const SizedBox(
            height: 20,
        ),
            Text(
                "Total Wrong Answers : $wrongQ",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        const SizedBox(
            height: 20,
        ),
            Text(
                "Total Omitted Questions : $ommitedQuestion",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        const SizedBox(
            height: 20,
        ),
            ElevatedButton(
                onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const SubjectListScreen(),
                  ),
                        (Route < dynamic > route) => false);
                },
                child: const Text("Start Quiz Again"),
          )
        ],
      ),
    );
    }
}