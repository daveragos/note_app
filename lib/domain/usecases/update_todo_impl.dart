import '../entity/todo.dart';
import '../repository/todos.dart';
import 'update_todo.dart';

class UpdateTodoUseCaseImpl extends UpdateTodoUseCase {
  UpdateTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;
  @override
  Future<void> call(Todo todo) {
    return todosRepository.updateTodo(todo);
  }
}
