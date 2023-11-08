import '../entity/todo.dart';

abstract class SaveTodoUseCase {
  Future<void> call(Todo todo);
}
