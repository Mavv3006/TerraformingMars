import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';
import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class PlayCards extends StatefulWidget {
  final double outsidePadding = 32;
  final double buttonWidth = 50;

  @override
  _PlayCardsState createState() => _PlayCardsState();
}

class _PlayCardsState extends State<PlayCards> {
  final TextEditingController textEditingController = TextEditingController();

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

    return CustomListElement(
      padding: EdgeInsets.only(
        left: widget.outsidePadding,
        right: widget.outsidePadding,
        top: 6,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RessourceValueText("Karte ausspielen für:"),
              CustomTextInput(textEditingController),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ActionButton(
                buttonWidth: widget.buttonWidth,
                text: "Credits",
                onPressed: () {
                  try {
                    int amount = int.parse(textEditingController.text);
                    if (amount <= 0) return;
                    mc.playCards(amount);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Du hast eine Karte für $amount MC ausgespielt"),
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
              ),
              ActionButton(
                buttonWidth: widget.buttonWidth,
                text: "Stahl",
                onPressed: () {
                  try {
                    int cardValue = int.parse(textEditingController.text);
                    if (cardValue <= 0) return;
                    steel.playCards(cardValue);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Du hast eine Karte für $cardValue Stahl ausgespielt"),
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
              ),
              ActionButton(
                buttonWidth: widget.buttonWidth,
                text: "Titan",
                onPressed: () {
                  try {
                    int amount = int.parse(textEditingController.text);
                    if (amount <= 0) return;
                    titan.playCards(amount);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Du hast eine Karte für $amount Titan ausgespielt"),
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
              ),
              // TODO: Implement Button for playing Cards with MC + Titan or Steel
            ],
          ),
        ],
      ),
    );
  }
}
