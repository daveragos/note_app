import 'package:note_app/domain/model/todo.dart';
import 'package:note_app/domain/model/todos.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();
  Future<void> saveTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<void> deleteAllTodos(Todo todo);
  Future<Todo?> getTodoById(String id);
}
