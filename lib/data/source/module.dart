import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../model/todo_model.dart';
import 'todo_localdb.dart';
import 'todo_localdb_impl.dart';

final localDbProvider = Provider<TodoLocalDB>(
  (ref) {
    final Box<TodoModel> box = Hive.box('todos');
    return TodoLocalDBImpl(box);
  },
);
