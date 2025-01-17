import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';
import 'package:terraforming_mars/components/play_cards_alert_dialog.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/settings/settingsModel.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class PlayCards extends StatefulWidget {
  final double outsidePadding = 32;
  final double buttonWidth = 50;

  @override
  _PlayCardsState createState() => _PlayCardsState();
}

class _PlayCardsState extends State<PlayCards> {
  final TextEditingController textEditingController = TextEditingController();
  Widget buttonRow;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MegaCredits mc = Provider.of<MegaCredits>(context);
    final Titan titan = Provider.of<Titan>(context);
    final Steel steel = Provider.of<Steel>(context);
    final Heat heat = Provider.of<Heat>(context);

    if (Provider.of<SettingsModel>(context, listen: false)
        .heatAsMCSwitchState) {
      buttonRow = Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildCreditsButton(mc),
              buildSteelButton(steel),
              buildTitanButton(titan),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildHeatButton(heat),
              buildCominationButton(),
            ],
          ),
        ],
      );
    } else {
      buttonRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildCreditsButton(mc),
          buildSteelButton(steel),
          buildTitanButton(titan),
          buildCominationButton(),
        ],
      );
    }

    return CustomListElement(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: widget.outsidePadding,
              right: widget.outsidePadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const RessourceValueText('Karte ausspielen für:'),
                CustomTextInput(textEditingController),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: buttonRow,
          ),
        ],
      ),
    );
  }

  Widget buildCreditsButton(MegaCredits mc) {
    return ActionButton(
      buttonWidth: widget.buttonWidth,
      text: 'Credits',
      onPressed: () {
        try {
          final int amount = int.parse(textEditingController.text);
          if (amount <= 0) {
            return;
          }
          mc.playCard(amount);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Du hast eine Karte für ${mc.lastCardValue} MC ausgespielt'),
            ),
          );
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gebe eine Zahl ein.'),
            ),
          );
        } on ValueTooLowException catch (e) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.errorMessage(),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildHeatButton(Heat heat) {
    return ActionButton(
      text: 'Wärme',
      onPressed: () {
        try {
          final int cardValue = int.parse(textEditingController.text);
          if (cardValue <= 0) {
            return;
          }
          heat.playCard(cardValue);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Du hast eine Karte für ${heat
                      .lastCardValue} Wärme ausgespielt'),
            ),
          );
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gebe eine Zahl ein'),
            ),
          );
        } on ValueTooLowException catch (e) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      },
    );
  }

  Widget buildTitanButton(Titan titan) {
    return ActionButton(
      buttonWidth: widget.buttonWidth,
      text: 'Titan',
      onPressed: () {
        try {
          final int cardValue = int.parse(textEditingController.text);
          if (cardValue <= 0) {
            return;
          }
          titan.playAmount(cardValue);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Du hast eine Karte für ${titan
                      .lastCardValue} Titan ausgespielt'),
            ),
          );
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gebe eine Zahl ein.'),
            ),
          );
        } on ValueTooLowException catch (e) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(e.errorMessage()),
            ),
          );
        }
      },
    );
  }

  Widget buildCominationButton() {
    return ActionButton(
      text: 'Kombination',
      onPressed: () {
        showDialog<Widget>(
          context: context,
          builder: (BuildContext context) {
            return PlayCardsAlertDialog();
          },
        );
      },
    );
  }

  Widget buildSteelButton(Steel steel) {
    return ActionButton(
      buttonWidth: widget.buttonWidth,
      text: 'Stahl',
      onPressed: () {
        try {
          final int cardValue = int.parse(textEditingController.text);
          if (cardValue <= 0) {
            return;
          }
          steel.playCard(cardValue);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Du hast eine Karte für ${steel
                      .lastCardValue} Stahl ausgespielt'),
            ),
          );
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gebe eine Zahl ein.'),
            ),
          );
        } on ValueTooLowException catch (e) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(e.errorMessage()),
            ),
          );
        }
      },
    );
  }
}
