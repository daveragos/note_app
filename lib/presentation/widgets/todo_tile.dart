import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/domain/entity/todo.dart';
import 'package:note_app/presentation/providers/module.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[500]),
      child: ListTile(
        title: Text(todo.title),
        subtitle: todo.description != null && todo.description!.isNotEmpty
            ? Text(todo.description!)
            : null,
        onTap: () {
          context.go('/todos/${todo.id}');
        },
        trailing: Checkbox(
          value: todo.completed,
          onChanged: (value) {
            if (value != null) {
              final newTodo = todo.copyWith(completed: value);
              ref.read(todosListModel).saveTodos(newTodo);
            }
          },
        ),
      ),
    );
  }
}
