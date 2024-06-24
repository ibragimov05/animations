import 'package:animations_hw/controller/switch_controller.dart';
import 'package:flutter/material.dart';

class SwitchNotifier extends InheritedWidget {
  final SwitchController switchController;

  const SwitchNotifier({
    super.key,
    required this.switchController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant SwitchNotifier oldWidget) {
    return oldWidget.switchController != switchController;
  }

  static SwitchController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SwitchNotifier>()!
        .switchController;
  }
}
