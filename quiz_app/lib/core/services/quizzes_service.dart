import 'package:quiz_app/core/data/mock_data/quizes.dart';
import 'package:quiz_app/core/data/models/question.dart';

class QuizzesService{
  int _quizNum = 0;
  int _currentQuestionIndex = 0;
  List<int> _answers = [];

  void startQUiz(int quizNum){
    quizzes[quizNum].questions.shuffle();
    _quizNum = quizNum;
    _currentQuestionIndex = 0;
    _answers = [];
  }
  
  void saveAnswer(int answerIndex){
    _answers.add(answerIndex);
  }

  List<String> getQuizzesTitles(){
    return quizzes.map((e) => e.title).toList();
  }

  Question? getNextQuestion(){
    if(_currentQuestionIndex >= quizzes[_quizNum].questions.length){
      return null;
    }
    return quizzes[_quizNum].questions[_currentQuestionIndex++];
  }


  int getNumOfQuestions(){
    return quizzes[_quizNum].questions.length;
  }

  List<Question> getQuestions(){
    return quizzes[_quizNum].questions;
  }

  List<int> getAnswers(){
    return _answers;
  }

  int getPoints(){
    int points = 0;
    for (int i = 0; i < quizzes[_quizNum].questions.length; i++) {
      points += (_answers[i] == quizzes[_quizNum].questions[i].answerIndex) ? 1 : 0;
    }
    return points;
  }
}