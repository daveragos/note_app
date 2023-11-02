import 'package:note_app/domain/model/todo.dart';

abstract class SaveTodoUseCase {
  Future<void> call(Todo todo);
}
