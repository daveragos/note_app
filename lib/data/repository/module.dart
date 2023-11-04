import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/data/repository/todos_repository_impl.dart';
import 'package:note_app/data/source/module.dart';
import 'package:note_app/domain/repository/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodosRepositoryImpl(ref.read(localDbProvider));
});
