part of 'todo_bloc.dart';


abstract class TodoEvent extends Equatable{
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String title;
  const AddTodoEvent(this.title);
  @override
  List<Object?> get props => [title];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  const DeleteTodoEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;
  const UpdateTodoEvent(this.todo);
  @override
  List<Object?> get props => [todo];
}
