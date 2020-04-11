import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/components/custom_scaffold.dart';
import 'package:terraforming_mars/layout/historyScreen/historyLayoutBody.dart';
import 'package:terraforming_mars/models/history/history.dart';
import 'package:terraforming_mars/models/history/historyMessage.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class HistoryLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Verlauf',
      appBarActions: <Widget>[
        IconButton(
          icon: Icon(
            CustomIcons.undo,
          ),
          onPressed: Provider.of<History>(context).isEmpty
              ? null
              : () {
            final HistoryMessage lastEvent =
            Provider.of<History>(context, listen: false)
                .getLastEntry();
                  print('HistoryLayout -> Last History Event: ' +
                      lastEvent.toString());
                  switch (lastEvent.type) {
                    case MegaCredits:
                      Provider.of<MegaCredits>(context, listen: false)
                          .undo(lastEvent);
                      break;
                    case Titan:
                      Provider.of<Titan>(context, listen: false)
                          .undo(lastEvent);
                      break;
                    case Steel:
                      Provider.of<Steel>(context, listen: false)
                          .undo(lastEvent);
                      break;
                    case Terraforming:
                      Provider.of<Terraforming>(context, listen: false)
                          .undo(lastEvent);
                      break;
                    case Energy:
                      Provider.of<Energy>(context, listen: false)
                          .undo(lastEvent);
                      break;
                    case Heat:
                      Provider.of<Heat>(context, listen: false).undo(lastEvent);
                      break;
                    case Crop:
                      Provider.of<Crop>(context, listen: false).undo(lastEvent);
                      break;
                    case SettingsModel:
                      Provider.of<SettingsModel>(context, listen: false)
                          .undo(lastEvent);
                      break;
                    default:
                      print('Unexpected Type: ${lastEvent.type}');
                      return;
                  }
                },
        ),
      ],
      body: HistoryLayoutBody(),
    );
  }
}
