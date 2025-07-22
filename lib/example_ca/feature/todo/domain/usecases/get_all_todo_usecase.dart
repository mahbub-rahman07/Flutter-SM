import 'package:flutter/material.dart';

import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetAllTodoUseCase {
  final TodoRepository todoRepository;

  GetAllTodoUseCase(this.todoRepository);

  Future<List<Todo>> call() async {
    final response  = await todoRepository.fetchTodos();
    return response.isEmpty ? List.empty() : response;
  }
}