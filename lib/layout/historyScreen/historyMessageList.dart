import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/custom_list.dart';
import 'package:terraforming_mars/models/history/history.dart';

class HistoryMessageList extends StatelessWidget {
  const HistoryMessageList(this.history);

  final History history;

  @override
  Widget build(BuildContext context) {
    return CustomList(
      children: history.getWidgetList(),
    );
  }
}
