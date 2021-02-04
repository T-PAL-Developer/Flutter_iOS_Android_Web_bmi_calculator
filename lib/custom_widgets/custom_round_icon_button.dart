import 'package:flutter/material.dart';

class CustomRoundIconButton extends StatelessWidget {
  const CustomRoundIconButton(
      {@required this.icon, @required this.onPressed, this.onLongPressed});

  final IconData icon;
  final Function onPressed;
  final Function onLongPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      onLongPress: onLongPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}
