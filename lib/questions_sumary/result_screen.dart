import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_sumary/questions_sumary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> choosenAnswers;
  void Function() restartQuiz;

  ResultScreen(this.restartQuiz, {super.key, required this.choosenAnswers});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> sumary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      sumary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }

    return sumary;
  }

  @override
  Widget build(BuildContext context) {
    final sumaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = sumaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSumary(sumaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: restartQuiz,
                 style:TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                icon: const Icon(Icons.refresh),
                label:const Text(
                  'Restart Quiz!',
                 
                ))
          ],
        ),
      ),
    );
  }
}
