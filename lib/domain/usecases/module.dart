import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/data/repository/module.dart';
import 'package:note_app/domain/usecases/get_todos.dart';
import 'package:note_app/domain/usecases/get_todos_impl.dart';

final getTodosProvider = Provider<GetTodosUseCase>((ref) {
  return GetTodosUseCaseImpl(ref.read(todosProvider));
});
