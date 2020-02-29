import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list.dart';
import 'package:terraforming_mars/models/history/history.dart';

class HistoryMessageList extends StatelessWidget {
  final History history;

  HistoryMessageList(this.history);

  @override
  Widget build(BuildContext context) {
    return CustomList(
      children: history.getWidgetList(),
    );
  }
}
