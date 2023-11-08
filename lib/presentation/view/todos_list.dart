import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/app/utils/extensions.dart';
import '../providers/module.dart';
import '../widgets/todo_tile.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = context.colorScheme;
    final deviceSize = context.deviceSize;

    final todosList = ref.watch(todosListState);
    final active = todosList.active;
    final completed = todosList.completed;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: color.primary,
                child: Center(
                  child: Column(
                    children: [
                      const Gap(30),
                      Text(
                        'Aug, 7, 2023',
                        style: context.textTheme.headlineSmall
                            ?.copyWith(color: color.surface, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 130,
            child: active.isEmpty
                ? const Center(
                    child: Text('TODO is empty!'),
                  )
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          width: deviceSize.width,
                          decoration: BoxDecoration(
                            color: color.primaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                            itemCount: active.length,
                            itemBuilder: (context, index) {
                              final todo = active[index];
                              return TodoTile(todo: todo);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.15,
            minChildSize: 0.1,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white60,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: completed.length,
                    itemBuilder: (context, index) {
                      final todo = completed[index];
                      return TodoTile(todo: todo);
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
