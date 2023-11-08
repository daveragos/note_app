import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entity/todo.dart';
import '../providers/module.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: List.filled(
            6,
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 3),
            )),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
        color: Colors.green[600],
      ),
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
