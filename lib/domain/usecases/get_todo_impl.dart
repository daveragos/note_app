import 'package:note_app/domain/entity/todo.dart';
import 'package:note_app/domain/entity/todos.dart';
import 'package:note_app/domain/repository/todos.dart';
import 'package:note_app/domain/usecases/get_todo.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  GetTodoUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;
  @override
  Future<Todo?> call(String id) {
    return todosRepository.getTodoById(id);
  }
}
