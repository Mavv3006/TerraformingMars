import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/settings_text_input_row.dart';
import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';
import 'package:terraforming_mars/theme/colors.dart';

import 'terraforming_alert_dialog.dart';

class PlayCardsAlertDialog extends StatefulWidget {
  @override
  _PlayCardsAlertDialogState createState() => _PlayCardsAlertDialogState();
}

class _PlayCardsAlertDialogState extends State<PlayCardsAlertDialog> {
  int _mcValue = 0;
  int _titanValue = 0;
  int _steelValue = 0;
  int _heatValue = 0;

  List<Widget> layoutList;

  bool _isInputCorrect = true;
  bool _isEnoughToPlayCards = true;

  TextEditingController _mcController = TextEditingController();
  TextEditingController _titanController = TextEditingController();
  TextEditingController _steelController = TextEditingController();
  TextEditingController _heatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _orangeTheme = Theme.of(context)
        .textTheme
        .body1
        .copyWith(color: AppColors.orangeColor);

    var _wrongInput = Padding(
      padding: EdgeInsets.only(top: 12),
      child: Text(
        "Falsche Eingabe",
        style: _orangeTheme,
      ),
    );

    var _notEnoughtMoney = Padding(
      padding: EdgeInsets.only(top: 12),
      child: Text(
        "Nicht genug Ressourcen",
        style: _orangeTheme,
      ),
    );

    var mcLayout = SettingsTextInputRow(
      text: "MegaCredits:",
      controller: _mcController,
      onSubmitted: (String value) {
        try {
          int newValue = int.parse(value);
          _mcValue = newValue;
        } on FormatException catch (_) {
          showWrongInputText();
        }
      },
    );
    var titanLayout = Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: SettingsTextInputRow(
        text: "Titan:",
        controller: _titanController,
        onSubmitted: (String value) {
          try {
            int newValue = int.parse(value);
            _titanValue = newValue;
          } on FormatException catch (_) {
            showWrongInputText();
          }
        },
      ),
    );

    var steelLayout = Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: SettingsTextInputRow(
        text: "Stahl:",
        controller: _steelController,
        onSubmitted: (String value) {
          try {
            int newValue = int.parse(value);
            _steelValue = newValue;
          } on FormatException catch (_) {
            showWrongInputText();
          }
        },
      ),
    );
    var heatLayout = Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: SettingsTextInputRow(
        text: "Wärme:",
        controller: _heatController,
        onSubmitted: (String value) {
          try {
            int newValue = int.parse(value);
            _heatValue = newValue;
          } on FormatException catch (_) {
            showWrongInputText();
          }
        },
      ),
    );

    if (Provider.of<SettingsModel>(
      context,
      listen: false,
    ).heatAsMCSwitchState) {
      layoutList = [
        mcLayout,
        steelLayout,
        titanLayout,
        heatLayout,
      ];
    } else {
      layoutList = [
        mcLayout,
        steelLayout,
        titanLayout,
      ];
    }

    if (!_isInputCorrect) {
      layoutList.add(_wrongInput);
    }

    if (!_isEnoughToPlayCards) {
      layoutList.add(_notEnoughtMoney);
    }

    return TerraformingAlertDialog(
      title: "Welche Kombination?",
      declineButtonTitle: "Abbrechen",
      declineButtonOnPressed: () {
        Navigator.of(context).pop();
      },
      acceptButtonTitle: "Bestätigen",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: layoutList,
      ),
      acceptButtonOnPressed: () {
        buyCards();
        if (_isEnoughToPlayCards) Navigator.of(context).pop();
      },
    );
  }

  void buyCards() {
    print(
      "{_mcValue: $_mcValue, _titanValue: $_titanValue, _steelValue: $_steelValue, _heatValue: $_heatValue}",
    );
    try {
      if (_mcValue > 0) {
        Provider.of<MegaCredits>(context, listen: false).playCards(_mcValue);
      }
      if (_titanValue > 0) {
        Provider.of<Titan>(context, listen: false).playCards(_titanValue);
      }
      if (_steelValue > 0) {
        Provider.of<Steel>(context, listen: false).playCards(_steelValue);
      }
      if (_heatValue > 0) {
        Provider.of<Heat>(context, listen: false).playCards(_heatValue);
      }
    } on ValueTooLowException catch (_) {
      setState(() {
        _isEnoughToPlayCards = false;
      });
      Timer(Duration(seconds: 5), () {
        setState(() {
          _isEnoughToPlayCards = true;
        });
      });
    }
  }

  void showWrongInputText() {
    setState(() {
      _isInputCorrect = false;
    });
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isInputCorrect = true;
      });
    });
  }
}
