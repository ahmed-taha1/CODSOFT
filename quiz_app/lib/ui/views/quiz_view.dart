import 'package:flutter/material.dart';
import 'package:quiz_app/core/di/dependency_injection.dart';
import 'package:quiz_app/core/helpers/spacer.dart';
import 'package:quiz_app/core/theming/styles.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/ui/widgets/custom_button.dart';
import '../../core/theming/app_colors.dart';
import '../../logic/quizzes_service.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final quizzesService = getIt<QuizzesService>();

  @override
  Widget build(BuildContext context) {
    Question? question = quizzesService.getNextQuestion();
    if (question == null) {
      return const Scaffold(
        body: Center(
          child: Text('No more questions'),
        ),
      );
    }

    List<String> answers = question.answersTxt;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: backGroundGradient,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // verticalSpace(50),
                Text(
                  question.questionText,
                  style: font30WhiteBold,
                  textAlign: TextAlign.center,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: CustomButton(
                            text: answers[index],
                            onPressed: () {
                              quizzesService.saveAnswer(index);
                              setState(() {});
                            }));
                  },
                  itemCount: question.answersTxt.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
