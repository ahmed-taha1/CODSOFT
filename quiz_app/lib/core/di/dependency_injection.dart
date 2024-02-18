import 'package:get_it/get_it.dart';
import '../../logic/quizzes_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<QuizzesService>(QuizzesService());
}