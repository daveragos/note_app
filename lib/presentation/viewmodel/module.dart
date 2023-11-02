import 'package:note_app/domain/model/todos.dart';
import 'package:note_app/domain/usecases/module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
Future<Todos> todosList(TodosListRef ref) async {
  final usecase = ref.watch(getTodosProvider);
  final items = await usecase.call();
  return items;
}
