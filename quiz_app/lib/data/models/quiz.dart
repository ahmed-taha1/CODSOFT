import 'package:quiz_app/data/models/question.dart';

class Quiz{
  final String title;
  final List<Question> questions;

  Quiz(this.title, this.questions);
}