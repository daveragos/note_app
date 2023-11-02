import 'package:note_app/data/repository/module.dart';
import 'package:note_app/domain/model/todos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
Future<Todos> getTodos(GetTodosRef ref) {
  final todos = ref.watch(todosProvider);
  return todos.loadTodos();
}
