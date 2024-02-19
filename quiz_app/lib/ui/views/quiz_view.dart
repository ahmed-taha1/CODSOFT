import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/di/dependency_injection.dart';
import 'package:quiz_app/core/theming/styles.dart';
import 'package:quiz_app/data/models/question.dart';
import 'package:quiz_app/ui/widgets/custom_button.dart';
import '../../core/routes/routes.dart';
import '../../core/theming/app_colors.dart';
import '../../logic/quizzes_service.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  List<Question> questions = getIt<QuizzesService>().getQuestions();
  int currQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> answers = questions[currQuestionIndex].answersTxt;

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
                  questions[currQuestionIndex].questionText,
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
                              getIt<QuizzesService>().saveAnswer(index);
                              setState(() {
                                currQuestionIndex++;
                                if(currQuestionIndex >= questions.length){
                                  context.go(Routes.resultView.path);
                                }
                              });
                            }));
                  },
                  itemCount: questions[currQuestionIndex].answersTxt.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
