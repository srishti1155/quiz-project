import 'package:flutter/material.dart';
import 'package:flutter_projects/results_screen.dart';
import 'package:flutter_projects/start_screen.dart';
import 'package:flutter_projects/questions_screen.dart';
import 'package:flutter_projects/questions.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget ? activeScreen;

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear(); // Clear selected answers
      activeScreen = StartScreen(switchScreen);
    });
  }


  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length){
      setState(() {
       // selectedAnswers = [];
        activeScreen =  ResultsScreen(chosenAnswers: selectedAnswers,
        onRestart:  restartQuiz
          ,) ;
      });
    }
  }
  @override
  void initState(){
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  void switchScreen(){
    setState(() {
      activeScreen =  QuestionScreen(
        onSelectAnswer: chooseAnswer,);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home:   Scaffold(
            body: Container(

                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Colors.greenAccent,
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    )
                ),
                child: activeScreen
            )

        )

    );
  }

}
