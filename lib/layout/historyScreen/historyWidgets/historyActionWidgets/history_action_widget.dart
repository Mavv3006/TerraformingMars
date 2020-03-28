import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/layout/historyScreen/historyWidgets/historyActionWidgets/history_play_cards_with_heat.dart';
import 'package:terraforming_mars/layout/historyScreen/historyWidgets/history_widget.dart';
import 'package:terraforming_mars/models/action/action_type.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';

import 'history_asteroid.dart';
import 'history_build_city.dart';
import 'history_build_factory.dart';
import 'history_build_forest_with_crop.dart';
import 'history_build_forest_with_mc.dart';
import 'history_build_ocean.dart';
import 'history_buy_cards.dart';
import 'history_increase_temperatur.dart';
import 'history_play_cards_with_mc.dart';
import 'history_play_cards_with_steel.dart';
import 'history_play_cards_with_titan.dart';
import 'history_sell_cards_widget.dart';

class HistoryActionWidget extends HistoryWidget {
  HistoryActionWidget({
    Key key,
    @required HistoryMessage historyMessage,
  }) : super(key: key, historyMessage: historyMessage);

  @override
  Widget build(BuildContext context) {
    switch (historyMessage.actionType) {
      case ActionType.SELL_CARDS:
        return HistorySellCardsWidget(historyMessage: historyMessage);
      case ActionType.BUILD_FACTORY:
        return HistoryBuildFactory(historyMessage: historyMessage);
      case ActionType.BUILD_CITY:
        return HistoryBuildCity(historyMessage: historyMessage);
      case ActionType.BUILD_FOREST_WITH_MC:
        return HistoryBuildForestWithMegaCredits(
            historyMessage: historyMessage);
      case ActionType.BUILD_OCEAN:
        return HistoryBuildOcean(historyMessage: historyMessage);
      case ActionType.ASTEROID:
        return HistoryAsteroid(historyMessage: historyMessage);
      case ActionType.INCREASE_TEMPERATUR:
        return HistoryIncreaseTemperatur(historyMessage: historyMessage);
      case ActionType.BUILD_FOREST_WITH_CROP:
        return HistoryBuildForestWithCrop(historyMessage: historyMessage);
      case ActionType.BUY_CARDS:
        return HistoryBuyCards(historyMessage: historyMessage);
      case ActionType.PLAY_CARDS_WITH_MC:
        return HistoryPlayCardsWithMegaCredits(historyMessage: historyMessage);
      case ActionType.PLAY_CARDS_WITH_STEEL:
        return HistoryPlayCardsWithSteel(historyMessage: historyMessage);
      case ActionType.PLAY_CARDS_WITH_TITAN:
        return HistoryPlayCardsWithTitan(historyMessage: historyMessage);
      case ActionType.PLAY_CARDS_WITH_HEAT:
        return HistoryPlayCardsWithHeat(historyMessage: historyMessage);
    }
    return CustomListElement(
      child: RessourceValueText(
          "noch nicht implementiert: ${historyMessage.actionType}"),
    );
  }
}
