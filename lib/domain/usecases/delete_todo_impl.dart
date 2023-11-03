import 'package:note_app/domain/entity/todo.dart';
import 'package:note_app/domain/repository/todos.dart';
import 'package:note_app/domain/usecases/delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;
  @override
  Future<void> call(Todo todo) {
    return todosRepository.deleteTodo(todo);
  }
}
