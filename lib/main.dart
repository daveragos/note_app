import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/data/model/todo_model.dart';
import 'package:note_app/presentation/app.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //initialize hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');

  runApp(const ProviderScope(child: TodosApp()));
}
