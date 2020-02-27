import 'package:terraforming_mars/models/terraformingValueData/ressourceValue.dart';

class Energy extends RessourceValue {
  int _oldValue = 0;

  Energy() : super("Energie");

  @override
  void nextRound() {
    _oldValue = value;
    value = production;
    notifyListeners();
  }

  int get oldValue => _oldValue;
}
