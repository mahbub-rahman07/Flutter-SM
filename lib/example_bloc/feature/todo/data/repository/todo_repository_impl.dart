

import '../../domain/entities /todo.dart';
import '../../domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final List<Todo> _todos = [];

  @override
  Future<List<Todo>> fetchTodos() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    return _todos;
  }

  @override
  Future<void> addTodo(Todo todo) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    _todos.add(todo);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));
    _todos.removeWhere((todo) => todo.id == id);
  }
}