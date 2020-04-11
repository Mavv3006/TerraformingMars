import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/layout/historyScreen/historyMessageList.dart';

import '../../models/history/history.dart';

class HistoryLayoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<History>(
      builder: (BuildContext context, History data, Widget child) =>
          HistoryMessageList(data),
    );
  }
}
