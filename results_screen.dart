
import 'package:flutter/material.dart';
 import 'package:flutter_projects/questions.dart';
 import 'package:flutter_projects/question_summary.dart';
 //import 'package:flutter_projects/start_screen.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,
  required this.chosenAnswers,
  required this.onRestart});

  final List<String> chosenAnswers;
  final void Function () onRestart;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary =[];

    for(var i=0; i<chosenAnswers.length; i++){
       summary.add(
           {
         'question_index' : i,
         'question' : questions[i].text,
         'correct_answer' : questions[i].answers[0],
         'user_answer' : chosenAnswers[i],

       });
    }

      return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'],
    )
        .length;

    return SizedBox(
        width: double.infinity,

        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You answered $numCorrectQuestion out of $numTotalQuestion questions correctly !',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                  const SizedBox(height: 30),
                  QuestionSummary(summaryData),
                  const SizedBox(height: 30),
                   TextButton.icon(
                    onPressed:  onRestart,
                     style: TextButton.styleFrom(
                       foregroundColor: Colors.white,
                     ),
                     icon: const Icon(Icons.refresh),
                     label: const Text('Restart Quiz'),
                   )

                    /* child:  Row (
                  mainAxisAlignment : MainAxisAlignment.center ,
                   children : [
                     Container(
                       decoration: BoxDecoration(
                         border: Border.all(
                           color: Colors.deepPurple,
                           width: 2,
                         ),
                         borderRadius:  const BorderRadius.all(Radius.circular(10)),
                       ),
                     padding: const EdgeInsets.all(8),

                   child: const Row(
                     children: [
                         Icon(Icons.restart_alt),
                      Text('Restart Quiz !' ,
                    style: TextStyle( fontSize: 20,
                 color: Colors.deepPurple,
                 fontWeight: FontWeight.bold),
                   ),
                         ] */

                  ]


            )
            )
        );

  }
  }