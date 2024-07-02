import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultRow extends StatelessWidget {
  final String questionIndex, question, correctAnswer, userAnswer;
  final bool isCorrect;

  const ResultRow(this.questionIndex, this.question, this.correctAnswer,
      this.userAnswer, this.isCorrect,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.only(right: 30,top: 15),

          decoration: BoxDecoration(
            color: isCorrect ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: Alignment.topCenter,
          child: Text(
            questionIndex,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 20),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question,
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                correctAnswer,
                style: GoogleFonts.inter(
                  color: Colors.redAccent,
                  fontSize: 15,
                ),
              ),
              Text(
                userAnswer,
                style: GoogleFonts.inter(
                  color: Colors.greenAccent,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20,)
              
            ],
          ),
        ),
      ],
    );
  }
}
