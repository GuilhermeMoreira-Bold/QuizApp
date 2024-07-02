import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_sumary/result_row.dart';

class QuestionsSumary extends StatelessWidget {
  final List<Map<String, Object>> sumary;
  QuestionsSumary(this.sumary, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: sumary.map(
            (data) {
              return ResultRow(
                  ((data['question_index'] as int) + 1).toString(),
                  data['question'].toString(),
                  data['correct_answer'].toString(),
                  data['user_answer'].toString(),
                  data['user_answer'] == data['correct_answer']);
            },
          ).toList(),
          
        ),
      ),
    );
  }
}
