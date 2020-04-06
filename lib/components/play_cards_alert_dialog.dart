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
  bool _hasPlayedCard = false;

  TextEditingController _mcController = TextEditingController();
  TextEditingController _titanController = TextEditingController();
  TextEditingController _steelController = TextEditingController();
  TextEditingController _heatController = TextEditingController();

  var _wrongInput = AlertText(text: "Falsche Eingabe");
  var _notEnoughtMoney = AlertText(text: "Nicht genug Ressourcen");
  var _playedCard = AlertText(
    text: "Karte ausgespielt",
    textColor: AppColors.accentColor,
  );

  @override
  void initState() {
    super.initState();
    _mcController.addListener(_listenToMcController);
    _titanController.addListener(_listenToTitanController);
    _steelController.addListener(_listenToSteelController);
    _heatController.addListener(_listenToHeatController);
  }

  _listenToMcController() {
    try {
      if (_mcController.text.length == 0) return;
      int cardValue = int.parse(_mcController.text);
      _mcValue = cardValue;
    } on FormatException catch (_) {
      _showWrongInputText();
    }
  }

  _listenToTitanController() {
    try {
      if (_titanController.text.length == 0) return;
      int newValue = int.parse(_titanController.text);
      _titanValue = newValue;
    } on FormatException catch (_) {
      _showWrongInputText();
    }
  }

  _listenToSteelController() {
    try {
      if (_steelController.text.length == 0) return;
      int newValue = int.parse(_steelController.text);
      _steelValue = newValue;
    } on FormatException catch (_) {
      _showWrongInputText();
    }
  }

  _listenToHeatController() {
    try {
      if (_heatController.text.length == 0) return;
      int newValue = int.parse(_heatController.text);
      _heatValue = newValue;
    } on FormatException catch (_) {
      _showWrongInputText();
    }
  }

  @override
  void dispose() {
    _mcController.dispose();
    _titanController.dispose();
    _steelController.dispose();
    _heatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mcLayout = SettingsTextInputRow(
      text: "MegaCredits:",
      controller: _mcController,
    );
    var titanLayout = Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: SettingsTextInputRow(
        text: "Titan:",
        controller: _titanController,
      ),
    );
    var steelLayout = Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: SettingsTextInputRow(
        text: "Stahl:",
        controller: _steelController,
      ),
    );
    var heatLayout = Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: SettingsTextInputRow(
        text: "Wärme:",
        controller: _heatController,
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

    if (_hasPlayedCard) {
      layoutList.add(_playedCard);
    }

    return TerraformingAlertDialog(
      title: "Welche Kombination?",
      declineButtonTitle: "Abbrechen",
      declineButtonOnPressed: _hasPlayedCard
          ? null
          : () {
              Navigator.of(context).pop();
            },
      acceptButtonTitle: "Bestätigen",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: layoutList,
      ),
      acceptButtonOnPressed: _hasPlayedCard
          ? null
          : () {
              _buyCard(context);
            },
    );
  }

  void _buyCard(BuildContext context) {
    print(
      "{_mcValue: $_mcValue, _titanValue: $_titanValue, _steelValue: $_steelValue, _heatValue: $_heatValue}",
    );
    if (_canPlayCards(context)) {
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

        _showHasPlayedCard(context);
      } on ValueTooLowException catch (_) {
        print("ValueTooLowException");
        _showNotEnoughMoney();
      }
    } else {
      print("Cannot Play Cards");
      _showNotEnoughMoney();
    }
  }

  void _showNotEnoughMoney() {
    setState(() {
      _isEnoughToPlayCards = false;
    });
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isEnoughToPlayCards = true;
      });
    });
  }

  bool _canPlayCards(BuildContext context) {
    List<bool> enoughToPlayCards = [false, false, false, false];
    if ((_mcValue > 0 &&
            Provider.of<MegaCredits>(context, listen: false)
                .canPlayCards(_mcValue)) ||
        _mcValue == 0) {
      enoughToPlayCards[0] = true;
    }
    if ((_titanValue > 0 &&
            Provider.of<Titan>(context, listen: false)
                .canPlayCards(_titanValue)) ||
        _titanValue == 0) {
      enoughToPlayCards[1] = true;
    }
    if ((_steelValue > 0 &&
            Provider.of<Steel>(context, listen: false)
                .canPlayCards(_steelValue)) ||
        _steelValue == 0) {
      enoughToPlayCards[2] = true;
    }
    if ((_heatValue > 0 &&
            Provider.of<Heat>(context, listen: false)
                .canPlayCards(_heatValue)) ||
        _heatValue == 0) {
      enoughToPlayCards[3] = true;
    }

    print("Enough to Play Cards: $enoughToPlayCards");

    return enoughToPlayCards.every((element) {
      return element == true;
    });
  }

  void _showWrongInputText() {
    setState(() {
      _isInputCorrect = false;
    });
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isInputCorrect = true;
      });
    });
  }

  void _showHasPlayedCard(BuildContext context) {
    setState(() {
      _hasPlayedCard = true;
    });
    Timer(Duration(milliseconds: 1250), () {
      Navigator.of(context).pop();
    });
  }
}

class AlertText extends StatelessWidget {
  const AlertText({
    Key key,
    @required this.text,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    var _orangeTheme = Theme.of(context)
        .textTheme
        .body1
        .copyWith(color: this.textColor ?? AppColors.orangeColor);

    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Text(
        text,
        style: _orangeTheme,
      ),
    );
  }
}
