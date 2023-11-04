import 'package:note_app/data/model/todo_model.dart';

abstract class TodoLocalDB {
  Future<void> create(TodoModel model);
  Future<List<TodoModel>?> read();
  Future<void> update(TodoModel model);
  Future<void> delete(TodoModel model);
}
