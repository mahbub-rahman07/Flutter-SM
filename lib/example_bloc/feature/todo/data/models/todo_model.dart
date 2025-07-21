import 'package:flutter/material.dart';
import '../../domain/entities /todo.dart';


class TodoModel extends Todo {
  const TodoModel({required super.id, required super.title, required super.description, required super.isCompleted});
}