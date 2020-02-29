import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/components/custom_scaffold.dart';
import 'package:terraforming_mars/layout/historyScreen/historyMessageList.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class HistoryLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: "Verlauf",
      appBarActions: <Widget>[
        IconButton(
          icon: Icon(
            CustomIcons.undo,
          ),
          onPressed: () {
            var lastEvent = Provider.of<History>(context).getLastEntry();
            switch (lastEvent.type) {
              case MegaCredits:
                Provider.of<MegaCredits>(context).undo(lastEvent);
                break;
              case Titan:
                Provider.of<Titan>(context).undo(lastEvent);
                break;
              case Steel:
                Provider.of<Steel>(context).undo(lastEvent);
                break;
              case Terraforming:
                Provider.of<Terraforming>(context).undo(lastEvent);
                break;
              case Energy:
                Provider.of<Energy>(context).undo(lastEvent);
                break;
              case Heat:
                Provider.of<Heat>(context).undo(lastEvent);
                break;
              case Crop:
                Provider.of<Crop>(context).undo(lastEvent);
                break;
              case SettingsModel:
                Provider.of<SettingsModel>(context).undo(lastEvent);
                break;
              default:
                print("Unexpected Type: ${lastEvent.type}");
                return;
            }
          },
        ),
      ],
      child: Consumer<History>(
        builder: (context, data, child) => HistoryMessageList(data),
      ),
    );
  }
}
