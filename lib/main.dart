import 'package:flutter/material.dart';
import 'package:flutter_foudations/randomizer_change_notifier.dart';
import 'package:flutter_foudations/range_selector_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
      child: MaterialApp(
        title: 'Ramdomizer',
        home: RangeSelectorPage(),
      ),
    );
  }
}
