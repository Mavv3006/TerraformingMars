import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list.dart';
import 'package:terraforming_mars/components/custom_list_element.dart';
import 'package:terraforming_mars/components/custom_scaffold.dart';
import 'package:terraforming_mars/components/ressourceValueText.dart';

class SettingsLayout extends StatefulWidget {
  @override
  _SettingsLayoutState createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends State<SettingsLayout> {
  final textController = TextEditingController(text: "test");

  @override
  void initState() {
    super.initState();
    textController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: "Einstellungen",
      child: CustomList(
        children: [
          CustomListElement(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RessourceValueText("Stahl zu MegaCredits"),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter a search term",
                        ),
                        controller: textController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    RessourceValueText("Titan zu MegaCretits"),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "2nd Text Field",
                        ),
                        onChanged: (String value) => print("2nd Value: $value"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _printLatestValue() {
    print("1st Value: ${textController.text}");
  }
}
