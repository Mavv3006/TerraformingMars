import 'package:terraforming_mars/layout/ressourceLayouts/megaCredits.dart';
import 'package:terraforming_mars/layout/ressourceLayouts/steel.dart';
import 'package:terraforming_mars/layout/ressourceLayouts/titan.dart';
import 'package:terraforming_mars/layout/ressourceLayouts/heat.dart';
import 'package:terraforming_mars/layout/ressourceLayouts/energy.dart';
import 'package:terraforming_mars/layout/ressourceLayouts/plant.dart';
import 'ressources.dart';
import 'terraformingValue.dart';

class RessourceValues {
  static final RessourceValues instance = new RessourceValues._internal();

  RessourceValues._internal();

  static final Ressources megaCredits = new MegaCredits();
  static final Ressources steel = new Steel();
  static final Ressources titanium = new Titanium();
  static final Ressources plant = new Plant();
  static final Ressources energy = new Energy();
  static final Ressources heat = new Heat();
  static final TerraformingValue terraformingValue = new TerraformingValue();
}
