import 'package:note_app/domain/entity/todos.dart';

import '../repository/todos.dart';
import 'get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  GetTodosUseCaseImpl(this.todoRepository);
  final TodosRepository todoRepository;
  @override
  Future<Todos> call() {
    return todoRepository.loadTodos();
  }
}
