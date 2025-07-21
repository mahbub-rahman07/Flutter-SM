import 'package:flutter/material.dart';

import '../entities /todo.dart';

abstract class TodoRepository {
  /// Fetches all todos.
  Future<List<Todo>> fetchTodos();

  /// Adds a new todo.
  Future<void> addTodo(Todo todo);

  /// Updates an existing todo.
  Future<void> updateTodo(Todo todo);

  /// Deletes a todo by its ID.
  Future<void> deleteTodo(String id);
}