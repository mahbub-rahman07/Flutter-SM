import 'package:flutter/material.dart';

import '../entities /todo.dart';
import '../repositories/todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository todoRepository;

  DeleteTodoUseCase(this.todoRepository);

  Future<void> call(String id) async {
    await todoRepository.deleteTodo(id);
  }
}