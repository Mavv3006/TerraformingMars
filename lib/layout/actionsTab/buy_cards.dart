import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/components/customButton.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_text_input.dart';
import 'package:terraforming_mars/exceptions/valueTooLowException.dart';
import 'package:terraforming_mars/models/terraformingValueData/megaCredits.dart';

class BuyCards extends StatefulWidget {
  @override
  _BuyCardsState createState() => _BuyCardsState();
}

class _BuyCardsState extends State<BuyCards> {
  final double outsidePadding = 32;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MegaCredits mc = Provider.of<MegaCredits>(context);
    return CustomListElement(
      padding: EdgeInsets.only(
        left: outsidePadding,
        right: outsidePadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomTextInput(textEditingController),
          ActionButton(
            onPressed: () {
              try {
                final int amount = int.parse(textEditingController.text);
                if (amount <= 0) {
                  return;
                }
                mc.buyCards(amount);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Du hast eine Karte für $amount MC gekauft'),
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
            text: 'neue Karten kaufen',
          )
        ],
      ),
    );
  }
}
