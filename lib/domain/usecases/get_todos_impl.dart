import 'package:note_app/domain/model/todos.dart';
import 'package:note_app/domain/repository/todos.dart';
import 'package:note_app/domain/usecases/get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  GetTodosUseCaseImpl(this.todoRepository);
  final TodosRepository todoRepository;
  @override
  Future<Todos> call() {
    return todoRepository.loadTodos();
  }
}
