import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

enum Gender {
  male,
  female,
}

class GenderLogic {
  Gender _selectedGender;

  void selectedGender({@required Gender gender}) {
    _selectedGender = gender;
  }

  Color changeCardState({@required Gender gender}) {
    return _selectedGender == gender ? kActiveCardColor : kInactiveCardColor;
  }

  Color changeIconState({@required Gender gender}) {
    return _selectedGender == gender ? kActiveIconColor : kInactiveIconColor;
  }
}
