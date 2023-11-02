import 'package:note_app/domain/model/todo.dart';
import 'package:note_app/domain/repository/todos.dart';
import 'package:note_app/domain/usecases/save_todo.dart';

class SaveTodoUseCaseImpl extends SaveTodoUseCase {
  SaveTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;
  @override
  Future<void> call(Todo todo) {
    return todosRepository.saveTodo(todo);
  }
}
