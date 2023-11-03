import 'package:note_app/domain/entity/todos.dart';

abstract class GetTodosUseCase {
  Future<Todos> call();
}
