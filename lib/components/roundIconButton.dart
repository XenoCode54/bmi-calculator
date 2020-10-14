import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;

  final Function pressed;

  RoundedIconButton({this.icon, this.pressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      elevation: 0.0,
      shape: CircleBorder(),
      child: Icon(icon),
      fillColor: Color(0xff15182D),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
    );
  }
}
