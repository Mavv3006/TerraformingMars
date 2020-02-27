import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  final List<Widget> children;

  const CustomList({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.transparent);
      },
      itemCount: children.length,
    );
  }
}
