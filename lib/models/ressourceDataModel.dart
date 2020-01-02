import 'package:scoped_model/scoped_model.dart';

class RessourceDataModel extends Model {
  final terraFormingValue = new _TerraformingValue();
  final megaCredits = new _RessourceValue.startBy(20);
  final titan = new _RessourceValue();
  final heat = new _RessourceValue();
  final crop = new _RessourceValue();
  final energy = new _RessourceValue();
  final steel = new _RessourceValue();
}

class _TerraformingValue {
  int _value = 20;

  get value {
    return _value;
  }

  increment() {
    _value++;
  }

  decrement() {
    _value--;
  }
}

class _RessourceValue extends _TerraformingValue {
  _RessourceValue.startBy(int value) {
    _value = value;
  }

  _RessourceValue() {
    _value = 0;
  }
}
