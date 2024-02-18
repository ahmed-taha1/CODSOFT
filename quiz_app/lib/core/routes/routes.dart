enum Routes {
  homePage("/"),
  quizView("/quiz-page"),
  summaryView("/summary-page");

  final String path;

  const Routes(this.path);
}