import '../entity/todo.dart';
import '../repository/todos.dart';
import 'get_todo.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  GetTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;
  @override
  Future<Todo?> call(String id) {
    return todosRepository.getTodoById(id);
  }
}
