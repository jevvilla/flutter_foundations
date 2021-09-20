import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_foudations/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  RandomizerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Consumer<RandomizerChangeNotifier>(
          builder: (context, notifier, child) {
            return Text(
              notifier.generatedNumber?.toString() ?? 'Generate a number',
              style: TextStyle(fontSize: 35),
            );
          },
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () =>
              context.read<RandomizerChangeNotifier>().generateRandomNumber(),
          label: Text('generate')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
