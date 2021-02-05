import 'package:flutter/material.dart';

class CustomButtonsLogic {
  int value;
  int minValue;
  int maxValue;

  CustomButtonsLogic(
      {@required this.value, @required this.minValue, @required this.maxValue});

  void incrementValue() {
    if (value < maxValue) {
      value++;
    }
  }

  void decrementValue() {
    if (value > minValue) {
      value--;
    }
  }
}
