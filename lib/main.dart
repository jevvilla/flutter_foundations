import 'package:flutter/material.dart';
import 'package:flutter_foudations/randomizer_state_notifier.dart';
import 'package:flutter_foudations/range_selector_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(AppWidget());
}

final randomizerProvider =
    StateNotifierProvider<RandomizerStateNotifier, RandomizerState>(
        (ref) => RandomizerStateNotifier());

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Ramdomizer',
        home: RangeSelectorPage(),
      ),
    );
  }
}
