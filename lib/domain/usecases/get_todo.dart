import 'package:note_app/domain/model/todo.dart';

abstract class GetTodoUseCase {
  Future<Todo?> call(String id);
}
