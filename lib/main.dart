import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'example_bloc/core/app_bloc_observer.dart';
import 'example_bloc/core/di.dart';
import 'example_bloc/feature/todo/presentation/view/todo_screen.dart';

void main() {
  init();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoScreen(),
    );
  }
}
