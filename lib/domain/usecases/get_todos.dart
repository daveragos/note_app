import 'package:note_app/domain/model/todos.dart';

abstract class GetTodosUseCase {
  Future<Todos> call();
}
