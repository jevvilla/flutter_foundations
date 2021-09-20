import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();

  int max = 0;
  int min = 0;
  int? _generatedNumber;

  int? get generatedNumber => _generatedNumber;

  void generateRandomNumber() {
    _generatedNumber = min + _randomGenerator.nextInt(max + 1 - min);
    notifyListeners();
  }
}
