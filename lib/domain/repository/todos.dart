import 'package:note_app/domain/entity/todo.dart';
import 'package:note_app/domain/entity/todos.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();
  Future<void> saveTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<void> deleteAllTodos();
  Future<Todo?> getTodoById(String id);
}
