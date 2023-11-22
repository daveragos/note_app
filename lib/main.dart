import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/domain/entity/todo_category.dart';
import 'data/model/todo_model.dart';
import 'presentation/app.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //initialize hive
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(TodoModelAdapter());
  Hive.registerAdapter(TaskCategoryAdapter());

  // Reopen the box
  await Hive.openBox<TodoModel>('todos');

  runApp(const ProviderScope(child: TodosApp()));
}
