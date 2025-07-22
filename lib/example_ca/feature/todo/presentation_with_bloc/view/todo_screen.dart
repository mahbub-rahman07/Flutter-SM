import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:state_management/example_ca/core/di.dart';
import '../../../../core/app_lifecycle_handler.dart';
import '../bloc/todo_bloc.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final lifecycle = Get.put(AppLifecycleHandler());
    lifecycle.onResumed = () {
      print('TODO App resumed');
    };

    return BlocProvider(
      create: (_) => dm<TodoBloc>()..add(LoadTodos()),
      child: Scaffold(
        appBar: AppBar(title: Text("Todo App")),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(child: TextField(controller: controller)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          context.read<TodoBloc>().add(
                            AddTodoEvent(controller.text),
                          );
                          controller.clear();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: context.watch<TodoBloc>().state is TodoLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: context
                              .watch<TodoBloc>()
                              .state
                              .todos
                              .length,
                          itemBuilder: (context, index) {
                            final todo = context
                                .watch<TodoBloc>()
                                .state
                                .todos[index];
                            return ListTile(
                              title: Text(todo.title),
                              subtitle: Text(todo.description),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  context.read<TodoBloc>().add(
                                    DeleteTodoEvent(todo.id),
                                  );
                                },
                              ),
                              onTap: () {
                                context.read<TodoBloc>().add(
                                  UpdateTodoEvent(todo),
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
