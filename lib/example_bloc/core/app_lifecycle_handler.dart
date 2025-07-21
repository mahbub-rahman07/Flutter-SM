import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// A reusable GetX lifecycle handler for app-wide lifecycle tracking.
class AppLifecycleHandler extends GetxController with WidgetsBindingObserver {
  VoidCallback? onResumed;
  VoidCallback? onPaused;
  VoidCallback? onInactive;
  VoidCallback? onDetached;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (onResumed != null) onResumed!();
        print('AppLifecycleState.resumed is not supported in this context.');
        break;
      case AppLifecycleState.paused:
        if (onPaused != null) onPaused!();
        print('AppLifecycleState.paused is not supported in this context.');
        break;
      case AppLifecycleState.inactive:
        if (onInactive != null) onInactive!();
        print('AppLifecycleState.inactive is not supported in this context.');
        break;
      case AppLifecycleState.detached:
        if (onDetached != null) onDetached!();
        print('AppLifecycleState.detached is not supported in this context.');
        break;
      case AppLifecycleState.hidden:
        print('AppLifecycleState.hidden is not supported in this context.');
      break;
    }
  }
}