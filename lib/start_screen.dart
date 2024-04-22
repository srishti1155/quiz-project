import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
   const StartScreen( this.startQuiz, {super.key});
  final void Function() startQuiz ;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Image.asset('lib/assets/quiz-logo.png'),
               //'https://tse2.mm.bing.net/th?id=OIP.zP3RP_b-MfafltNc5vj67gHaE6&pid=Api&P=0&h=180',width : 2000),
         const SizedBox( height : 20),
          const Text('Learn Flutter in a fun way !',
            style: TextStyle(color: Colors.black,
              fontSize: 20 ),
          ),
         const SizedBox( height: 20),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black
              ),
               icon: const Icon(Icons.arrow_forward_sharp),
              label: const Text('Start Quiz' ,
              style: TextStyle(color: Colors.black)),
          )
        ]
    )
    );

  }
  }