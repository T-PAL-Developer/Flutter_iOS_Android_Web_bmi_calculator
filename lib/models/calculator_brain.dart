import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You should eat less at night';
    } else if (_bmi > 18.5) {
      return 'You are perfect';
    } else {
      return 'You suppose to eat a little bit more';
    }
  }

  TextStyle resultTextColor() {
    if (_bmi >= 25) {
      return kBadResultTextStyle;
    } else {
      return kGoodResultTextStyle;
    }
  }
}
