import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/di/dependency_injection.dart';
import 'package:quiz_app/core/routes/routes.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/logic/quizzes_service.dart';
import 'package:quiz_app/ui/widgets/QuestionSummary.dart';

import '../../core/helpers/spacer.dart';
import '../../core/theming/app_colors.dart';
import '../../core/theming/styles.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzesService = getIt<QuizzesService>();
    final List<int> userAnswers = quizzesService.getUserAnswers();
    final List<Question> questions = quizzesService.getQuestions();
    final int correctAnswers = quizzesService.getNumOfCorrectAnswers();
    final int totalQuestions = questions.length;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: backGroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                verticalSpace(50),
                Text(
                  "You answered $correctAnswers out of $totalQuestions questions correctly!",
                  style: font30WhiteBold,
                  textAlign: TextAlign.center,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: QuestionSummary(
                        isCorrectAnswer:
                            questions[index].answerIndex == userAnswers[index],
                        questionNumber: (index + 1),
                        questionText: questions[index].questionText,
                        userAnswer:
                            questions[index].answersTxt[userAnswers[index]],
                        answerTxt: questions[index]
                            .answersTxt[questions[index].answerIndex],
                      ),
                    );
                  },
                ),
                verticalSpace(10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    context.go(Routes.homePage.path);
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}