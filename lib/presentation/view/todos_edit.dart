import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/domain/model/todo.dart';
import 'package:note_app/domain/usecases/module.dart';
import 'package:note_app/domain/usecases/save_todo.dart';
import 'package:note_app/presentation/viewmodel/module.dart';
import 'package:note_app/presentation/widgets/extensions.dart';
import 'package:shortid/shortid.dart';

class TodosEdit extends ConsumerStatefulWidget {
  const TodosEdit({super.key, this.todoId});
  final String? todoId;

  @override
  ConsumerState<TodosEdit> createState() => _TodosEditState();
}

class _TodosEditState extends ConsumerState<TodosEdit> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isCompleted = false;
  bool edited = false;
  late final model = ref.read(todosListModel);

  void change() {
    if (mounted) {
      setState(() {
        edited = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    titleController.addListener(change);
    descriptionController.addListener(change);
    if (widget.todoId != null) {
      model.getTodo(widget.todoId!).then((value) {
        if (value != null) {
          titleController.text = value.title;
          descriptionController.text = value.description ?? '';
          if (mounted) {
            setState(() {
              isCompleted = value.completed;
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.todoId == null
            ? const Text('New Todo')
            : const Text('Edit Todo'),
        actions: [
          if (widget.todoId != null)
            IconButton(
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final router = GoRouter.of(context);
                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete Todo?'),
                      content: const Text(
                          'Are you sure you want to delete this todo?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
                if (result == true) {
                  final todo = await model.getTodo(widget.todoId!);
                  await model.deleteTodo(todo!);
                  messenger.toast('Todo Deleted!');
                  if (router.canPop()) {
                    router.pop();
                  }
                }
              },
              icon: const Icon(Icons.delete),
              tooltip: 'Delete',
            ),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            onWillPop: () async {
              if (edited) {
                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Discard Changes?'),
                      content: const Text(
                          'Are you sure you want to discard your changes?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Discard'),
                        ),
                      ],
                    );
                  },
                );
                if (result == true) {
                  return true;
                }
                return false;
              }
              return true;
            },
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Completed'),
                  value: isCompleted,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        isCompleted = value!;
                        edited = true;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            final todo = Todo(
                id: widget.todoId ?? shortid.generate(),
                title: titleController.text,
                description: descriptionController.text,
                completed: isCompleted);

            final messenger = ScaffoldMessenger.of(context);
            final router = GoRouter.of(context);
            await model.saveTodos(todo);
            messenger.toast('Todo Saved!');
            if (router.canPop()) {
              router.pop();
            }
          }
        },
        icon: const Icon(Icons.save),
        label: const Text('Save'),
        tooltip: 'Save',
      ),
    );
  }
}
