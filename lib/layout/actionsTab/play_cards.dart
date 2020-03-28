import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';
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
    var mc = Provider.of<MegaCredits>(context);
    var titan = Provider.of<Titan>(context);
    var steel = Provider.of<Steel>(context);
    var heat = Provider.of<Heat>(context);

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
                RessourceValueText("Karte ausspielen für:"),
                CustomTextInput(textEditingController),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: buttonRow,
          ),
        ],
      ),
    );
  }

  Widget buildCreditsButton(MegaCredits mc) {
    return ActionButton(
      buttonWidth: widget.buttonWidth,
      text: "Credits",
      onPressed: () {
        try {
          int amount = int.parse(textEditingController.text);
          if (amount <= 0) return;
          mc.playCards(amount);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Du hast eine Karte für $amount MC ausgespielt"),
            ),
          );
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Gebe eine Zahl ein."),
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
      text: "Wärme",
      onPressed: () {
        try {
          int cardValue = int.parse(textEditingController.text);
          if (cardValue <= 0) return;
          heat.playCards(cardValue);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content:
                  Text("Du hast eine Karte für $cardValue Wärme ausgespielt"),
            ),
          );
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Gebe eine Zahl ein"),
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
      text: "Titan",
      onPressed: () {
        try {
          int cardValue = int.parse(textEditingController.text);
          if (cardValue <= 0) return;
          titan.playCards(cardValue);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content:
                  Text("Du hast eine Karte für $cardValue Titan ausgespielt"),
            ),
          );
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Gebe eine Zahl ein."),
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
      text: "Kombination",
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Alert Dialog"),
              content: Text("press close to close this Alert Dialog"),
              actions: <Widget>[
                FlatButton(
                  child: Text("close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget buildSteelButton(Steel steel) {
    return ActionButton(
      buttonWidth: widget.buttonWidth,
      text: "Stahl",
      onPressed: () {
        try {
          int cardValue = int.parse(textEditingController.text);
          if (cardValue <= 0) return;
          steel.playCards(cardValue);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content:
                  Text("Du hast eine Karte für $cardValue Stahl ausgespielt"),
            ),
          );
        } on FormatException catch (_) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Gebe eine Zahl ein."),
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
