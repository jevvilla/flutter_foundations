import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int min, max;
  final randomGenerator = Random();

  RandomizerPage({Key? key, required this.max, required this.min})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Text(
          generatedNumber.value?.toString() ?? 'Generate a number',
          style: TextStyle(fontSize: 35),
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            generatedNumber.value =
                min + randomGenerator.nextInt(max + 1 - min);
          },
          label: Text('generate')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
