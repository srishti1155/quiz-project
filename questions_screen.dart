// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/answer_button.dart';
import 'package:flutter_projects/questions.dart';


class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState () {
    return _QuestionState();
  }
}
class _QuestionState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++ ;
    });

  }
  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex] ;
    return  SizedBox(
        width : double.infinity ,
        child:   Container(
            margin: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text ( currentQuestion.text ,
                    style : const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign : TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ...currentQuestion.getShuffledAnswers().map((answer) {
                    return Column(
                      children: [
                        AnswerButton(answerText: answer,
                          onTap: () {
                            answerQuestion(answer);
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  } ),
                  /* AnswerButton(
                      answerText: currentQuestion.answers[0],
                      onTap: () {} ,
                  ),
                 AnswerButton(
                     answerText: currentQuestion.answers[1],
                     onTap: () {} ,
                 ),
                 AnswerButton(
                     answerText: currentQuestion.answers[2],
                     onTap: () {} ,
                 ),
                 AnswerButton(
                     answerText: currentQuestion.answers[3],
                     onTap: () {},
                 ) */
                ] //children
            )
        )
    );



  }
}