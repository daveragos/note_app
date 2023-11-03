import 'package:note_app/domain/entity/todo.dart';

abstract class DeleteTodoUseCase {
  Future<void> call(Todo todo);
}
