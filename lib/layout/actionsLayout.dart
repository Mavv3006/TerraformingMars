import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/myFloatingActionButton.dart';

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            thickness: 2,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class ActionsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Aktionen durchführen",
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 160,
              height: 40,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Karten ausspielen?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
            ),
            MyFloatingActionButton(() {}, Icons.add),
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
            ),
            MyFloatingActionButton(() {}, Icons.add),
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
            ),
            MyFloatingActionButton(() {}, Icons.add),
          ],
        ),
        MyDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 40,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'neue Karten kaufen?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
            ),
            MyFloatingActionButton(() {}, Icons.add),
          ],
        ),
        MyDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  fillColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                ),
                RawMaterialButton(
                  fillColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                  value: false,
                  onChanged: (bool) {},
                ),
                Text("TEST", style: Theme.of(context).textTheme.body1),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
