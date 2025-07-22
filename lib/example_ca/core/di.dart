import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_it/get_it.dart';

import '../feature/todo/data/repository/todo_repository_impl.dart';
import '../feature/todo/domain/repositories/todo_repository.dart';
import '../feature/todo/domain/usecases/add_todo_usecase.dart';
import '../feature/todo/domain/usecases/delete_todo_usecase.dart';
import '../feature/todo/domain/usecases/get_all_todo_usecase.dart';
import '../feature/todo/domain/usecases/update_todo_usecase.dart';
import '../feature/todo/presentation_with_bloc/bloc/todo_bloc.dart';
import '../feature/todo/presentation_with_getx/controller/todo_controller.dart';
import 'app_lifecycle_handler.dart';

final dm = GetIt.instance;

void init() {
  // Register your dependencies here
  dm.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl());

  // Use cases
  dm.registerLazySingleton(() => GetAllTodoUseCase(dm<TodoRepository>()));
  dm.registerLazySingleton(() => AddTodoUseCase(dm<TodoRepository>()));
  dm.registerLazySingleton(() => UpdateTodoUseCase(dm<TodoRepository>()));
  dm.registerLazySingleton(() => DeleteTodoUseCase(dm<TodoRepository>()));

  // Bloc
  dm.registerFactory<TodoBloc>(
    () => TodoBloc(
      dm<GetAllTodoUseCase>(),
      dm<AddTodoUseCase>(),
      dm<UpdateTodoUseCase>(),
      dm<DeleteTodoUseCase>(),
    ),
  );

  //   controller
  dm.registerLazySingleton<TodoController>(
    () => TodoController(
      dm<GetAllTodoUseCase>(),
      dm<AddTodoUseCase>(),
      dm<UpdateTodoUseCase>(),
      dm<DeleteTodoUseCase>(),
    ),
  );

  // App lifecycle handler
  Get.put(AppLifecycleHandler());
}
