import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: color.primary,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            iconSize: 50,
                            tooltip: 'add ',
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              context.go('/todos/new');
                            }),
                      ],
                    ),
                    Text(
                      'Aug, 7, 2023',
                      style: context.textTheme.headlineSmall
                          ?.copyWith(color: color.surface, fontSize: 20),
                    ),
                    Text(
                      'My TodoList',
                      style: context.textTheme.headlineMedium
                          ?.copyWith(color: color.surface, fontSize: 40),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: deviceSize.width,
                    height: deviceSize.height * 0.6,
                    decoration: BoxDecoration(
                      color: color.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        // active.isEmpty
                        //     ? const Center(
                        //         child: Text('TODO is empty!',
                        //             style: TextStyle(
                        //                 fontSize: 20, color: Colors.grey)),
                        //       )
                        //     :
                        ListView.builder(
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        // final todo = active[index];
                        return Text('data');
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
                  color: color.tertiaryContainer,
                  child:
                      //  completed.isEmpty
                      //     ? const Center(
                      //         child: Text('No Completed Task!',
                      //             style:
                      //                 TextStyle(fontSize: 20, color: Colors.grey)),
                      //       )
                      //     :
                      ListView.builder(
                    controller: scrollController,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      // final todo = completed[index];
                      return Text('data');
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
