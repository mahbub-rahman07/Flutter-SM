part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  final String? error;

  const TodoState({required this.todos, this.error});

  TodoState copyWith({List<Todo>? todos, String? error}) {
    return TodoState(
      todos: todos ?? this.todos,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [runtimeType,todos, error];
}
class TodoInitialState extends TodoState {
  TodoInitialState() : super(todos: []);
}
class TodoLoadingState extends TodoState {
  TodoLoadingState() : super(todos: []);
}
class TodoSuccessState extends TodoState {
  const TodoSuccessState(List<Todo> todos) : super(todos: todos);
}
class TodoErrorState extends TodoState {
  TodoErrorState(String error) : super(todos: [], error: error);
}

