import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:note_app/data/source/files.dart';
import 'package:note_app/domain/model/todo.dart';
import 'package:note_app/domain/model/todos.dart';
import 'package:note_app/domain/repository/todos.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl(this.files);
  final Files files;
  late final String path = 'todos.json';

  @override
  Future<Todos> loadTodos() async {
    // load todos from path
    final content = await files.read(path);
    if (content == null || content.isEmpty) return const Todos(values: []);
    //transform it to json and then todo list
    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<void> deleteAllTodos() async {
    await files.delete(path);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todos = await loadTodos();
    //remove the todo from the list
    todos.values.remove(todo);
    //save the list
    await files.write(path, jsonEncode(todos.toJson()));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();
    //search the todo by id
    return todos.values.firstWhereOrNull((element) => element.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();
    //add the todo to the list
    todos.values.add(todo);
    //save the list
    await files.write(path, jsonEncode(todos.toJson()));
  }
}
