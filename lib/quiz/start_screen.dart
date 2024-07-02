import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  
  StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(182, 203, 210, 251),
          ),
          const SizedBox(height: 30),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.frederickaTheGreat(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w100),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: ButtonStyle(
              side: WidgetStateBorderSide.resolveWith(
                (states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const BorderSide(
                        color: Color.fromARGB(255, 0, 157, 255));
                  }
                },
              ),
            ),
            icon: const Icon(
              Icons.arrow_right_alt_outlined,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
