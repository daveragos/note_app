import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/providers/module.dart';
import 'package:note_app/presentation/widgets/todo_tile.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosList = ref.watch(todosListState);
    final active = todosList.active;
    final completed = todosList.completed;
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              context.go('/todos/new');
            },
            icon: const Icon(Icons.add),
            tooltip: 'Add Todo',
          ),
        ],
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Todos')),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: active.isEmpty
                ? const Center(
                    child: Text('TODO is empty!'),
                  )
                : ListView.builder(
                    itemCount: active.length,
                    itemBuilder: (context, index) {
                      final todo = active[index];
                      return TodoTile(todo: todo);
                    },
                  ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.15,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                color: Colors.white60,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: completed.length,
                  itemBuilder: (context, index) {
                    final todo = completed[index];
                    return TodoTile(todo: todo);
                  },
                ),
              );
            },
          )
          // ExpansionTile(
          //   title: const Text('Completed'),
          //   children: [for (final todo in completed) TodoTile(todo: todo)],
          // )
        ],
      ),
    );
  }
}
