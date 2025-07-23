
import 'package:equatable/equatable.dart';
import 'package:state_management/example_ca/feature/todo/domain/entities/todo.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  final bool isLoading;
  final String? error;

  const TodoState({
    required this.todos,
    required this.isLoading,
    this.error,
  });

  factory TodoState.initial() {
    return TodoState(
      todos: [],
      isLoading: false,
      error: null,
    );
  }

  TodoState copyWith({
    List<Todo>? todos,
    bool? isLoading,
    String? error,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [runtimeType, todos, isLoading, error];
}