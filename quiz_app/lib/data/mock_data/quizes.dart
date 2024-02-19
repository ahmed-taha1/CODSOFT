import '../models/quiz.dart';
import 'mock_questions/english_questions.dart';
import 'mock_questions/flutter_questions.dart';
import 'mock_questions/german_questions.dart';
import 'mock_questions/history_questions.dart';
import 'mock_questions/math_questions.dart';
import 'mock_questions/science_questions.dart';

List<Quiz> quizzes = [
  Quiz("German Quiz", germanQuestions),
  Quiz("Math Quiz", mathQuestions),
  Quiz("Flutter Quiz", flutterQuestions),
  Quiz("English Quiz", englishQuestions),
  Quiz("History Quiz", historyQuestions),
  Quiz("Science Quiz", scienceQuestions),
];