import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  const CustomList({Key key, this.children}) : super(key: key);

  final List<Widget> children;

  static Widget mydivider = Divider(color: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return mydivider;
      },
      itemCount: children.length,
    );
  }
}
