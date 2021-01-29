import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class GenderLogic {
  static const Color _activeCardColor = Color(0xFF1D1E33);
  static const Color _inactiveCardColor = Color(0xFF111328);
  static const Color _inactiveIconColor = Colors.grey;
  static const Color _activeIconColor = Colors.white;

  Gender _selectedGender;

  void selectedGender({@required Gender gender}) {
    _selectedGender = gender;
  }

  Color changeCardState({@required Gender gender}) {
    return _selectedGender == gender ? _activeCardColor : _inactiveCardColor;
  }

  Color changeIconState({@required Gender gender}) {
    return _selectedGender == gender ? _activeIconColor : _inactiveIconColor;
  }
}
