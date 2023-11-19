import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/domain/entity/todos.dart';
import '../../domain/entity/todo.dart';
import '../../domain/usecases/module.dart';

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

  Future<void> updateTodos(Todo todo) async {
    await ref.read(updateTodoProvider).call(todo);
    await loadTodos();
  }

  Future<Todo?> getTodo(String id) async {
    return await ref.read(getTodoProvider).call(id);
  }

  Future<void> deleteTodo(Todo todo) async {
    await ref.read(deleteTodoProvider).call(todo);
    await loadTodos();
  }
}

final todosListState = StateNotifierProvider<TodosStateNotifier, Todos>(
  (ref) => TodosStateNotifier(ref),
);

final todosListModel = Provider<TodosStateNotifier>((ref) {
  return ref.watch(todosListState.notifier);
});
