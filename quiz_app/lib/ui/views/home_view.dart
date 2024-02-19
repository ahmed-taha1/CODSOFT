import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/di/dependency_injection.dart';
import 'package:quiz_app/core/helpers/spacer.dart';
import 'package:quiz_app/core/theming/app_colors.dart';
import 'package:quiz_app/core/theming/styles.dart';
import 'package:quiz_app/logic/quizzes_service.dart';
import 'package:quiz_app/ui/widgets/custom_button.dart';

import '../../core/routes/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizzesService quizzesService = getIt<QuizzesService>();
    final List<String> quizzesTitles = quizzesService.getQuizzesTitles();
    final controller = ScrollController();

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: backGroundGradient,
          ),
          child: SafeArea(
            child: FadingEdgeScrollView.fromSingleChildScrollView(
              gradientFractionOnEnd: 0.2,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                controller: controller,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(50),
                    Image.asset(
                      'assets/images/quiz-logo.png',
                      color: Colors.white70,
                      scale: 2.2,
                    ),
                    verticalSpace(40),
                    Text(
                      'Welcome please select a quiz to begin!',
                      style: font30WhiteBold,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(50),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quizzesTitles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: CustomButton(
                            text: quizzesTitles[index],
                            onPressed: () {
                              quizzesService.startQUiz(index);
                              context.go(Routes.quizView.path);
                            },
                            textStyle: font30WhiteBold.copyWith(fontSize: 20),
                          ),
                        );
                      },
                    ),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}