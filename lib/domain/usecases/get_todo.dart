import 'package:note_app/domain/entity/todo.dart';

abstract class GetTodoUseCase {
  Future<Todo?> call(String id);
}
