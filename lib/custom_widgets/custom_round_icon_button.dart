import 'package:flutter/material.dart';

class CustomRoundIconButton extends StatelessWidget {
  const CustomRoundIconButton(
      {@required this.icon,
      this.onPressed,
      this.onLongPressed,
      this.onLongPressedEnd});

  final IconData icon;
  final Function onPressed;
  final Function onLongPressed;
  final Function onLongPressedEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressed,
      onLongPressEnd: onLongPressedEnd,
      child: RawMaterialButton(
        child: Icon(icon),
        onPressed: onPressed,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0,
        ),
      ),
    );
  }
}
