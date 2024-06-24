import 'package:flutter/material.dart';

class SwitchController extends ChangeNotifier {
   bool _switchValue = false;

  bool get switchValue => _switchValue;

  void toggleSwitch(){
    _switchValue = !_switchValue;
    notifyListeners();
  }
}
