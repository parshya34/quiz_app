import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_data_model.dart';
import 'package:quiz_app/views/result_screen.dart';


class QuizScreen extends StatefulWidget {
  final String subjectName;

  const QuizScreen({super.key, required this.subjectName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  void quizResult(context) {
    userPercentage = 0;
    wrongQ = 0;
    omittedQ = 0;
    totalRight = 0;

    for (int i = 0; i < quizListData.length; i++) {
        if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
            omittedQ++;
        }
        if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
            totalRight++;
        }
        if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
            wrongQ++;
        }
    }

    userPercentage = ((totalRight / quizListData.length) * 100).round();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => ResultScreen(
                userPercentage: userPercentage,
                totalRight: totalRight,
                wrongQ: wrongQ,
                ommitedQuestion: omittedQ,
            ),
        ),
        (Route < dynamic > route) => false);

}


  final _pageController = PageController(initialPage: 0);
  int quesIndex = 0;
  int wrongQ = 0;
  int userPercentage = 0;
  int omittedQ = 0;
  int totalRight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(widget.subjectName),
        backgroundColor: const Color.fromARGB(255, 247, 169, 53),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question : ${quesIndex + 1}/${quizListData.length}", style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
            const SizedBox(height: 15,),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: quizListData.length,
                onPageChanged: (page) {
                  setState(() {
                    quesIndex = page;
                  });
                },
                itemBuilder: (context, index){
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(quizListData[index]['title'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    const SizedBox(height: 10,),
                    ...quizListData[index]['options'].map(
                      (data) => Padding(padding: EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(width: double.infinity,child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(int.parse(data['color'],),),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            if (quizListData[index]['is_answered'] == 0) {
                              setState(() {
                                if (data['value'] == quizListData[index]['answer']) {
                                  data['color'] = "0xFF31CD63";
                                  quizListData[index]['is_answer_status_right_wrong_omitted'] = 1;
                                } else {
                                  data['color'] = "0xFFFF0000";
                                  quizListData[index]['is_answer_status_right_wrong_omitted'] = 2;
                                }
                                quizListData[index]['is_answered'] = 1;
                              });
                            } else { }
                          },
                          child: Row(
                            children: [
                              Padding(padding: EdgeInsets.symmetric(vertical: 0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Color(int.parse(data['color'],)),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(data['option'],),
                              ),)
                            ),
                            Flexible(child: Text(data['value'], style: TextStyle(color: Colors.black),))

                          ],
                          )),
                      ),),),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (quesIndex == quizListData.length - 1) {
              quizResult(context);
          } 
          else {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 5),
                curve: Curves.easeIn,
            );
          }
        },
        label:
        Text(quesIndex == quizListData.length - 1 ? "Submit" : "Next"),
      ),
    );
  }
}