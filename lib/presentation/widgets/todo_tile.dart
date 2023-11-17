import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/app/utils/extensions.dart';
import '../../domain/entity/todo.dart';
import '../providers/module.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //strike the text if completed
    final isComplete =
        todo.completed ? TextDecoration.lineThrough : TextDecoration.none;
    return Container(
      // padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: List.filled(
          2,
          BoxShadow(
            color: context.colorScheme.secondary,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(3, 4),
            blurStyle: BlurStyle.inner,
          ),
        ),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        color: context.colorScheme.secondaryContainer,
      ),
      child: ListTile(
        leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Icon(todo.category.icon, color: todo.category.color)),
        title: Text(
          todo.title,
          style: TextStyle(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 1,
              wordSpacing: 1,
              height: 1.5,
              decoration: isComplete),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(todo.time), Text(todo.date)],
        ),
        // onTap: () {
        //   context.go('/todos/${todo.id}');
        // },
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
