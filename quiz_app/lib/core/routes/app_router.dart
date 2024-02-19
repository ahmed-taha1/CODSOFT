import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/routes/routes.dart';
import 'package:quiz_app/ui/views/result_view.dart';
import '../../ui/views/home_view.dart';
import '../../ui/views/quiz_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: Routes.homePage.path, builder: (context, state) => const HomeView()),
      GoRoute(path: Routes.quizView.path, builder: (context, state) => const QuizView()),
      GoRoute(path: Routes.resultView.path, builder: (context, state) => const ResultView()),
    ],
  );
}