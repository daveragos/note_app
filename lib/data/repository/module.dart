import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todos_repository_impl.dart';
import '../source/module.dart';
import '../../domain/repository/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodosRepositoryImpl(ref.read(localDbProvider));
});
