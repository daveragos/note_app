import 'package:note_app/domain/entity/todo.dart';

abstract class UpdateTodoUseCase {
  Future<void> call(Todo todo);
}
