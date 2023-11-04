import 'package:collection/collection.dart';
import 'package:note_app/data/model/todo_model.dart';
import 'package:note_app/data/source/todo_localdb.dart';
import 'package:note_app/domain/entity/todo.dart';
import 'package:note_app/domain/entity/todos.dart';
import 'package:note_app/domain/repository/todos.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl(this.localDB);
  final TodoLocalDB localDB;

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();
    final todoModel = TodoModel.fromEntity(todo);
    //check if already exist in the todos
    final todoIndex =
        todos.values.takeWhile((element) => element.id == todo.id);
    if (todoIndex.isEmpty) {
      localDB.create(todoModel);
    } else {
      localDB.update(todoModel);
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todos = await loadTodos();

    final todoModel = TodoModel.fromEntity(todo);
  }

  @override
  Future<Todos> loadTodos() async {
    final todos = await localDB.read();
    return Todos(values: todos!.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> deleteAllTodos() async {
    final todos = await loadTodos();
    for (var element in todos.values) {
      deleteTodo(element);
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todoModel = TodoModel.fromEntity(todo);
    localDB.delete(todoModel);
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await localDB.read();
    final todo = todos!.firstWhereOrNull((element) => element.id == id);
    return todo?.toEntity();
  }
}
