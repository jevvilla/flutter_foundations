import 'package:flutter/material.dart';
import 'package:flutter_foudations/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomizerPage extends ConsumerWidget {
  RandomizerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Text(
          randomizer.generatedNumber?.toString() ?? 'Generate a number',
          style: TextStyle(fontSize: 35),
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () =>
              context.read(randomizerProvider.notifier).generateRandomNumber(),
          label: Text('generate')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
