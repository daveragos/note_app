import 'package:note_app/domain/entity/todo.dart';
import 'package:note_app/domain/repository/todos.dart';
import 'package:note_app/domain/usecases/save_todo.dart';
import 'package:note_app/domain/usecases/update_todo.dart';

class UpdateTodoUseCaseImpl extends UpdateTodoUseCase {
  UpdateTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;
  @override
  Future<void> call(Todo todo) {
    return todosRepository.updateTodo(todo);
  }
}
