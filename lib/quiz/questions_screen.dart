import 'package:flutter/material.dart';
import 'package:quiz_app/quiz/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen(this.onSelectedAnswers, {super.key});
  final void Function(String answer) onSelectedAnswers;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  int questionsIndice = 0;
  var currentQuestions;

  void changeQuestion(String selectedAnswer) {
    widget.onSelectedAnswers(selectedAnswer);

    setState(() {
      if (questionsIndice == questions.length) {
        questionsIndice = 0;
        return;
      }
      
      questionsIndice++;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentQuestions = questions[questionsIndice];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestions.text,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestions.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, () {
                changeQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
