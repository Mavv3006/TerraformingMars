import 'package:terraforming_mars/models/defaultValue.dart';

class RessourceDataModel {
  RessourceDataModel();

  RessourceDataModel.fromValue({this.value, this.production});

  int value = DefaultRessourceValue.defaultValueValue;
  int production = DefaultRessourceValue.defaultProductionValue;
}

class TerraformingDataModel {
  int value = DefaultRessourceValue.defaultTerraformingStartValue;
}
