import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:state_management/example_ca/core/di.dart';
import 'package:state_management/example_ca/feature/todo/presentation_with_getx/controller/todo_controller.dart';
import 'package:state_management/example_ca/feature/todo/presentation_with_riverpod/provider/todo_notifier.dart';

class TodoReiverpodScreen extends ConsumerWidget {
  const TodoReiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final state = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Todo Riverpod App")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.isEmpty) return;
                    ref
                        .read(todoListProvider.notifier)
                        .addTodoItem(controller.text);
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: state.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return ListTile(
                        key: Key(todo.id),
                        title: Text(
                          todo.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: todo.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        leading: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (value) {
                            ref
                                .read(todoListProvider.notifier)
                                .updateTodoItem(todo);
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(todoListProvider.notifier)
                                .deleteTodoItem(todo.id);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
