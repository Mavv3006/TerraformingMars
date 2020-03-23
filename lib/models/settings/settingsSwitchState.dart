import 'package:flutter/foundation.dart';

class SettingsSwitchState extends ChangeNotifier {
  bool _currentState = true;

  bool get currentState => _currentState;

  set currentState(bool value) {
    _currentState = value;
    notifyListeners();
  }
}