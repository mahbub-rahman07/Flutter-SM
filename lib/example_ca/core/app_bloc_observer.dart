

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('Bloc changed: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Bloc error: ${bloc.runtimeType}, Error: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('Bloc closed: ${bloc.runtimeType}');
  }
}