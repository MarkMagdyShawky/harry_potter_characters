import 'package:go_router/go_router.dart';
import '../../features/details/presentation/pages/details_page.dart';
import '../../features/home/data/models/character.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRouter {
  GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: RoutsNames.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RoutsNames.details,
        builder: (context, state) => DetailsPage(character: state.extra as Character),
      )
    ],
  );
}

class RoutsNames {
  static const String home = '/';
  static const String details = '/DetailsPage';
}
