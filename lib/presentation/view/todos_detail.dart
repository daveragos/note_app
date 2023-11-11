import 'package:flutter/material.dart';
import 'package:note_app/domain/entity/todo.dart';
import 'package:gap/gap.dart';

class TodoDetail extends StatelessWidget {
  final Todo todo;

  const TodoDetail({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //the icon
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: todo.category.color.withOpacity(0.3)),
              child: Icon(todo.category.icon,
                  color: todo.category.color, size: 30)),
          const Gap(16),
          //the title
          Text(
            todo.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Time: ${todo.time}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),

          const Gap(16),
          Visibility(
            visible: todo.completed,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Todo Completed!!!'),
                Gap(20),
                Icon(Icons.check_box, color: Colors.green)
              ],
            ),
          ),
          const Gap(16),
          Divider(
            thickness: 1,
            color: todo.category.color,
          ),
          const Gap(16),
          Text(
            todo.description == null
                ? 'description not provided'
                : todo.description!,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Visibility(
            visible: !todo.completed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'todo to be completed on ${todo.date}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Gap(20),
                Icon(Icons.check_box, color: todo.category.color)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
