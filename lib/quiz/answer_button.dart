import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  void Function() func;

  AnswerButton(this.text, this.func, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      child: Text(text,textAlign: TextAlign.center,),
    );
  }
}
