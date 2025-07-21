import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:state_management/example_bloc/feature/todo/data/models/todo_model.dart';
import 'package:state_management/example_bloc/feature/todo/domain/usecases/add_todo_usecase.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities /todo.dart';
import '../../domain/usecases/delete_todo_usecase.dart';
import '../../domain/usecases/get_all_todo_usecase.dart';
import '../../domain/usecases/update_todo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  // Define your repository or use case here
  final GetAllTodoUseCase getTodos;
  final AddTodoUseCase addTodo;
  final UpdateTodoUseCase updateTodo;
  final DeleteTodoUseCase deleteTodo;

  TodoBloc(this.getTodos, this.addTodo, this.updateTodo, this.deleteTodo)
      : super(TodoLoadingState()) {
    on<LoadTodos>((event, emit) async {
      emit(TodoLoadingState());
      final todos = await getTodos();
      print('todos: $todos');
      emit(TodoState(todos: todos));
    });

    on<AddTodoEvent>((event, emit) {
      final todo = Todo(id: const Uuid().v4(), title: event.title, description: '', isCompleted: false);
      addTodo(todo);
      add(LoadTodos());
    });

    on<DeleteTodoEvent>((event, emit) {
      deleteTodo(event.id);
      add(LoadTodos());
    });

    on<UpdateTodoEvent>((event, emit) {
      updateTodo(event.todo);
      add(LoadTodos());
    });
  }
}

