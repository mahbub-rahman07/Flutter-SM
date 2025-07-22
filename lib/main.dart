import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:state_management/example_ca/feature/todo/presentation_with_getx/view/todo_getx_screen.dart';

import 'example_ca/core/app_bloc_observer.dart';
import 'example_ca/core/di.dart';
import 'example_ca/feature/todo/presentation_with_bloc/view/todo_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoGetxScreen(),
    );
  }
}
