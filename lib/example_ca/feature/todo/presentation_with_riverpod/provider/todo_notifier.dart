import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/example_ca/feature/todo/domain/entities/todo.dart';
import 'package:state_management/example_ca/feature/todo/presentation_with_riverpod/provider/todo_state.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/provider_di.dart';
import '../../domain/usecases/add_todo_usecase.dart';
import '../../domain/usecases/delete_todo_usecase.dart';
import '../../domain/usecases/get_all_todo_usecase.dart';
import '../../domain/usecases/update_todo_usecase.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  // define the use cases
  final GetAllTodoUseCase _getTodos;
  final AddTodoUseCase _addTodo;
  final UpdateTodoUseCase _updateTodo;
  final DeleteTodoUseCase _deleteTodo;

  // assign the use cases in the constructor
  TodoNotifier(
    this._getTodos,
    this._addTodo,
    this._updateTodo,
    this._deleteTodo,
  ) : super(TodoState.initial());

  // private methods to update the state
  void _setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  // private method to set error
  void _setError(String error) {
    state = state.copyWith(error: error);
  }

  Future<void> fetchTodos() async {
    try {
      _setLoading(true);
      final fetchedTodos = await _getTodos();
      state = state.copyWith(
        todos: fetchedTodos,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      _setError('Error fetching todos: $e');
      print('Error fetching todos: $e');
    }
  }

  Future<void> addTodoItem(String title) async {
    try {
      final todo = Todo(
        id: const Uuid().v4(),
        title: title,
        description: '',
        isCompleted: false,
      );
      await _addTodo(todo);
      await fetchTodos();
    } catch (e) {
      print('Error adding todo: $e');
    }
  }

  Future<void> updateTodoItem(Todo todo) async {
    try {
      await _updateTodo(todo);
      await fetchTodos();
    } catch (e) {
      print('Error updating todo: $e');
    }
  }

  Future<void> deleteTodoItem(String id) async {
    try {
      await _deleteTodo(id);
      await fetchTodos();
    } catch (e) {
      print('Error deleting todo: $e');
    }
  }
}

// Provider for the TodoNotifier
final todoListProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  return TodoNotifier(
    ref.read(getTodosProvider),
    ref.read(addTodoProvider),
    ref.read(updateProvider),
    ref.read(deleteTodoProvider),
  );
});
