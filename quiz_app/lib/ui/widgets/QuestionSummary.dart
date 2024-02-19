import 'package:flutter/material.dart';
import 'package:quiz_app/core/helpers/spacer.dart';
import 'package:quiz_app/core/theming/styles.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(
      {super.key,
      required this.isCorrectAnswer,
      required this.questionNumber,
      required this.questionText,
      required this.userAnswer,
      required this.answerTxt});

  final int questionNumber;
  final bool isCorrectAnswer;
  final String questionText;
  final String userAnswer;
  final String answerTxt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isCorrectAnswer ? Colors.greenAccent : Colors.redAccent,
              borderRadius: BorderRadius.circular(100),
            ),
            width: 30,
            height: 30,
            child: Center(
              child: Text(
                '$questionNumber',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questionText,
                    style: font17WhiteBold,
                  ),
                  verticalSpace(2),
                  Text(
                    userAnswer,
                    style: TextStyle(
                      color: isCorrectAnswer
                          ? const Color.fromARGB(190, 105, 240, 174)
                          : const Color.fromARGB(240, 255, 82, 82),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    answerTxt,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
