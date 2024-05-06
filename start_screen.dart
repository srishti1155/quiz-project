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
          const  SizedBox(height: 20),
        Image.network(
           '',
            width: 200, ),

         // Padding(padding: const EdgeInsets.all(20.0),
              // Image.asset('flutter_projects/android/app/src/main/res/drawable/quiz_logo.png'),

             const SizedBox( height : 10),

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