import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/viewmodel/module.dart';
import 'package:note_app/presentation/widgets/extensions.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(todosListModel);
    final todosList = ref.watch(todosListState);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todosList.values.length,
        itemBuilder: (context, index) {
          final todo = todosList.values[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description ?? ''),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/todos/new');
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Todo'),
        tooltip: 'Add Todo',
      ),
    );
  }
}
