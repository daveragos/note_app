import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/domain/model/todo.dart';
import 'package:note_app/domain/model/todos.dart';
import 'package:note_app/domain/usecases/module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// final todosListNotifier = ChangeNotifierProvider<ValueNotifier<Todos>>(
//   (ref) => ValueNotifier(
//     const Todos(values: []),
//   ),
// );

class TodosStateNotifier extends StateNotifier<Todos> {
  TodosStateNotifier(this.ref) : super(const Todos(values: [])) {
    loadTodos();
  }

  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.call();
  }

  Future<void> saveTodos(Todo todo) async {
    await ref.read(saveTodoProvider).call(todo);
    await loadTodos();
  }
}

final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>(
  (ref) => TodosStateNotifier(ref),
);

final todosListModel = Provider<TodosStateNotifier>((ref) {
  return ref.watch(todosListState.notifier);
});
