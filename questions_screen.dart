import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {

  var currentQuestionIndex=0;

  void answerQuestion(String selectedAnswer)
  {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });

  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const  EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(currentQuestion.text,
             style: const TextStyle(
               color: Colors.white,
             ),
             textAlign: TextAlign.center,
             ),
            const SizedBox(height: 30),

           // the three dots below is used for type conversion from list of answers to comma separated values in a list
           ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              },);
            }),

            // AnswerButton(answerText: currentQuestion.answers[4], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
