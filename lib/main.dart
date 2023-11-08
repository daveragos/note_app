import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'data/model/todo_model.dart';
import 'presentation/app.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //initialize hive
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(TodoModelAdapter());

  // Delete the box
  await Hive.deleteBoxFromDisk('todos');

  // Reopen the box
  await Hive.openBox<TodoModel>('todos');

  runApp(const ProviderScope(child: TodosApp()));
}
