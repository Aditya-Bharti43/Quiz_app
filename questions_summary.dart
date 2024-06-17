import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(fontSize:20,color: Color.fromARGB(
                        157, 175, 196, 8)),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        // the below line represents how type casting is done in flutter from integer to string data type
                        Text((data['question'] as String),
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(157, 6, 46, 131))),
                        const SizedBox(
                          height: 5,
                        ),
                        Text((data['user_answer']) as String,style: const TextStyle(fontSize: 13,color: Color.fromARGB(
                            120, 105, 5, 50)),),
                        Text((data['correct_answer']) as String,style: const TextStyle(color: Color.fromARGB(
                            105, 183, 194, 15)),),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
