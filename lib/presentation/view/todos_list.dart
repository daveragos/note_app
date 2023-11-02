import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/data/repository/module.dart';
import 'package:note_app/presentation/viewmodel/module.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosList = ref.watch(getTodosProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Todos'),
      ),
      body: todosList.map(
        loading: (loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error) {
          return Center(
            child: Text(error.stackTrace.toString()),
          );
        },
        data: (data) {
          return ListView.builder(
            itemCount: data.value.values.length,
            itemBuilder: (context, index) {
              final todo = data.value.values[index];
              return ListTile(
                  title: Text(todo.title),
                  subtitle: todo.description != null
                      ? Text(todo.description!)
                      : null);
            },
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
