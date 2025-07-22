import 'package:flutter/material.dart';

import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class UpdateTodoUseCase {
  final TodoRepository todoRepository;

  UpdateTodoUseCase(this.todoRepository);

  Future<void> call(Todo todo) async {
    if (todo.title.isEmpty) {
      throw Exception('Title and description cannot be empty');
    }
    await todoRepository.updateTodo(
      todo.copyWith(isCompleted: !todo.isCompleted),
    );
  }
}
