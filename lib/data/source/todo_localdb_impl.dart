import 'package:hive/hive.dart';
import 'package:note_app/data/model/todo_model.dart';
import 'package:note_app/data/source/todo_localdb.dart';

class TodoLocalDBImpl extends TodoLocalDB {
  TodoLocalDBImpl(this.todoBox);
  Box<TodoModel> todoBox;

  @override
  Future<void> create(TodoModel model) async {
    todoBox.put(model.id, model);
  }

  @override
  Future<List<TodoModel>?> read() async {
    return todoBox.values.toList();
  }

  @override
  Future<void> update(TodoModel model) async {
    todoBox.put(model.id, model);
  }

  @override
  Future<void> delete(TodoModel model) async {
    todoBox.delete(model.id);
  }
}
