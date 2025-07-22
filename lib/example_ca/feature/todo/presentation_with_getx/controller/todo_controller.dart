
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/todo.dart';
import '../../domain/usecases/add_todo_usecase.dart';
import '../../domain/usecases/delete_todo_usecase.dart';
import '../../domain/usecases/get_all_todo_usecase.dart';
import '../../domain/usecases/update_todo_usecase.dart';

class TodoController extends GetxController {
  final GetAllTodoUseCase _getTodos;
  final AddTodoUseCase _addTodo;
  final UpdateTodoUseCase _updateTodo;
  final DeleteTodoUseCase _deleteTodo;

  TodoController(
    this._getTodos,
    this._addTodo,
    this._updateTodo,
    this._deleteTodo,
  );

  final todos = <Todo>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() async {
    isLoading.value = true;
    try {
      final fetchedTodos = await _getTodos();
      todos.assignAll(fetchedTodos);
    } catch (e) {
      print('Error fetching todos: $e');
    }
    finally {
      isLoading.value = false;
    }
  }

  void addTodoItem(String title) async {
    try {
      final todo = Todo(
        id: const Uuid().v4(),
        title: title,
        description: '',
        isCompleted: false,
      );
      await _addTodo(todo);
      fetchTodos();
    } catch (e) {
      print('Error adding todo: $e');
    }
  }

  void updateTodoItem(Todo todo) async {
    try {
      await _updateTodo(todo);
      fetchTodos();
    } catch (e) {
      print('Error updating todo: $e');
    }
  }
  void deleteTodoItem(String id) async {
    try {
      await _deleteTodo(id);
      fetchTodos();
    } catch (e) {
      print('Error deleting todo: $e');
    }
  }


}