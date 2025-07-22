import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/example_ca/core/di.dart';
import 'package:state_management/example_ca/feature/todo/presentation_with_getx/controller/todo_controller.dart';

class TodoGetxScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  TodoGetxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCtrl = Get.put(dm<TodoController>());

    return Scaffold(
      appBar: AppBar(title: Text("Todo Getx App")),
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
                    todoCtrl.addTodoItem(controller.text.trim().toString());
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => todoCtrl.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: todoCtrl.todos.length,
                      itemBuilder: (context, index) {
                        final todo = todoCtrl.todos[index];
                        return ListTile(
                          title: Text(todo.title),
                          subtitle: Text(todo.description),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              todoCtrl.deleteTodoItem(todo.id);
                            },
                          ),
                          onTap: () {
                            todoCtrl.updateTodoItem(todo);
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
