import 'package:go_router/go_router.dart';
import 'package:portafolio/screens/home/view/home.dart';
import 'package:portafolio/screens/projects/view/projects.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/projects',
      builder: (context, state) => const Projects(),
    ),
  ],
);
