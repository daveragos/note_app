import 'package:note_app/domain/model/todo.dart';
import 'package:note_app/domain/model/todos.dart';
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
