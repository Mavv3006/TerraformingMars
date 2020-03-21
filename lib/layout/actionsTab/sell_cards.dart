import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';
import 'package:terraforming_mars/models/terraformingValueData/values.dart';

class SellCards extends StatefulWidget {
  @override
  _SellCardsState createState() => _SellCardsState();
}

class _SellCardsState extends State<SellCards> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mc = Provider.of<MegaCredits>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CustomTextInput(textEditingController),
        ActionButton(
          text: "Karten verkaufen",
          onPressed: () {
            try {
              var amount = int.parse(textEditingController.text);
              mc.sellCards(amount);
            } on FormatException catch (e) {
              print("'${textEditingController.text}' wurde eingegeben");
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Gebe eine Zahl ein."),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}