import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz/questions_screen.dart';
import 'package:quiz_app/questions_sumary/result_screen.dart';
import 'package:quiz_app/quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

enum Screens {
  startScreen,
  quizScreen,
  resultScreen,
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  Screens currentScreen = Screens.startScreen;

  void switchScreen() {
    setState(() {
      currentScreen = Screens.quizScreen;
    });
  }

  void restartQuiz(){
    setState(() {
      currentScreen = Screens.startScreen;
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentScreen = Screens.resultScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);

    if(currentScreen == Screens.quizScreen){
      screen = QuestionsScreen(chooseAnswer);
    }

    if(currentScreen == Screens.resultScreen){
      screen = ResultScreen(restartQuiz,choosenAnswers: selectedAnswers,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Color.fromARGB(255, 33, 150, 243), Colors.blueGrey],
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}