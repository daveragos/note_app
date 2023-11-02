import 'package:note_app/domain/model/todo.dart';

abstract class DeleteTodoUseCase {
  Future<void> call(Todo todo);
}
