import 'package:get_it/get_it.dart';
import 'package:quiz_app/core/services/quizzes_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<QuizzesService>(QuizzesService());
}