import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'todo_category.g.dart'; // Name of the generated file

@HiveType(typeId: 1) // Unique identifier for this type
enum TaskCategory {
  @HiveField(0)
  education(Icons.school, Colors.blueGrey),
  @HiveField(1)
  health(Icons.favorite, Colors.orange),
  @HiveField(2)
  home(Icons.home, Colors.green),
  @HiveField(3)
  others(Icons.calendar_month_rounded, Colors.purple),
  @HiveField(4)
  personal(Icons.person, Colors.lightBlue),
  @HiveField(5)
  shopping(Icons.shopping_bag, Colors.deepOrange),
  @HiveField(6)
  social(Icons.people, Colors.brown),
  @HiveField(7)
  travel(Icons.flight, Colors.pink),
  @HiveField(8)
  work(Icons.work, Colors.amber);

  static TaskCategory stringToTaskCategory(String name) {
    try {
      return TaskCategory.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategory(this.icon, this.color);
}
