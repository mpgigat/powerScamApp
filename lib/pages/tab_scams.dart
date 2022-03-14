import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scamhunters/services/scammer_service.dart';
import 'package:scamhunters/widgets/listScammers.dart';

class TabScammer extends StatelessWidget {
  const TabScammer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<ScammerService>(context).headLines;
    return ListScammers(headlines);
  }
}
