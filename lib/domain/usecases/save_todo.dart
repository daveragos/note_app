import 'package:note_app/domain/entity/todo.dart';

abstract class SaveTodoUseCase {
  Future<void> call(Todo todo);
}
