import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData,  {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool isCorrect = data['user_answer'] == data['correct_answer'];
            final Color textColor = isCorrect ? Colors.yellow : Colors.redAccent;
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(color: Colors.black,
                )
            ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Your answer: ${data['user_answer']}',
                        style: TextStyle(color: textColor,
                        fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Correct answer: ${data['correct_answer']}',
                        style: TextStyle(color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
            ]
            ,
            );
          }).toList(),
        ),
      ),
    );
  }
}




