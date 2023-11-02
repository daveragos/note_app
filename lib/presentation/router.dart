import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/view/home.dart';
import 'package:note_app/presentation/view/todos_list.dart';
import 'package:note_app/presentation/view/todos_edit.dart';

final router = GoRouter(
  initialLocation: '/todos',
  routes: [
    GoRoute(
      path: '/todos',
      builder: (context, state) => const TodosList(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const TodosEdit(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) => TodosEdit(
            todoId: state.pa,
          ),
        ),
      ],
    )
  ],
);
