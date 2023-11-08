import '../entity/todo.dart';

abstract class UpdateTodoUseCase {
  Future<void> call(Todo todo);
}
