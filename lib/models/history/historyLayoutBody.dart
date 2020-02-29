import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terraforming_mars/layout/historyScreen/historyMessageList.dart';

import 'history.dart';

class HistoryLayoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<History>(
      builder: (context, data, child) => HistoryMessageList(data),
    );
  }
}
