enum Routes {
  homePage("/"),
  quizView("/quiz-page"),
  resultView("/result-page");

  final String path;

  const Routes(this.path);
}