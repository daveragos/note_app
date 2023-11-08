import 'package:hive/hive.dart';
import 'package:note_app/domain/entity/todo_category.dart';
import '../../domain/entity/todo.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  bool completed;
  @HiveField(4)
  String time;
  @HiveField(5)
  String date;
  @HiveField(6)
  TaskCategory category;

  TodoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.completed,
      required this.time,
      required this.date,
      required this.category});

  factory TodoModel.fromEntity(Todo todo) => TodoModel(
        id: todo.id,
        title: todo.title,
        description: todo.description!,
        completed: todo.completed,
        time: todo.time,
        date: todo.date,
        category: todo.category,
      );

  Todo toEntity() {
    return Todo(
      id: id,
      title: title,
      description: description,
      completed: completed,
      time: time,
      date: date,
      category: category,
    );
  }
}
