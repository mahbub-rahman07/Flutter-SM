
//  provider dependency
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../feature/todo/data/repository/todo_repository_impl.dart';
import '../feature/todo/domain/usecases/add_todo_usecase.dart';
import '../feature/todo/domain/usecases/delete_todo_usecase.dart';
import '../feature/todo/domain/usecases/get_all_todo_usecase.dart';
import '../feature/todo/domain/usecases/update_todo_usecase.dart';

// Provider has own dependency injection system
// all providers for dependency injection by default lazy initialization
final todoRepositoryProvider = Provider((ref) => TodoRepositoryImpl());
final addTodoProvider = Provider((ref) => AddTodoUseCase(ref.read(todoRepositoryProvider)));
final deleteTodoProvider = Provider((ref) => DeleteTodoUseCase(ref.read(todoRepositoryProvider)));
final getTodosProvider = Provider((ref) => GetAllTodoUseCase(ref.read(todoRepositoryProvider)));
final updateProvider = Provider((ref) => UpdateTodoUseCase(ref.read(todoRepositoryProvider)));