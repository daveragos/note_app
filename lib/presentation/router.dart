import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/view/home.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
  ],
);
