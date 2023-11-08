import '../entity/todo.dart';
import '../repository/todos.dart';
import 'delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;
  @override
  Future<void> call(Todo todo) {
    return todosRepository.deleteTodo(todo);
  }
}
