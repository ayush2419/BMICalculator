import 'dart:math';

import 'package:flutter/material.dart';

class BMICalculator {
  BMICalculator({required this.weight, required this.height, this.bmi = 0});

  final int height;
  final int weight;

  double bmi;

  String getBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Over Weight';
    } else if (bmi >= 18.00) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (bmi >= 18) {
      return 'You have a normal body weight. Good Job!!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
