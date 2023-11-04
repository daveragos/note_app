import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:note_app/data/model/todo_model.dart';
import 'package:note_app/data/source/todo_localdb.dart';
import 'package:note_app/data/source/todo_localdb_impl.dart';

final localDbProvider = Provider<TodoLocalDB>(
  (ref) {
    final Box<TodoModel> box = Hive.box('todos');
    return TodoLocalDBImpl(box);
  },
);
