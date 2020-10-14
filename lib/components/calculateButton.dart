import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final Function tap;
  final String text;

  CalculateButton({@required this.tap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kCalculate,
          ),
        ),
        decoration: BoxDecoration(
          color: kLowBarColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 15),
        height: 80,
        width: double.infinity,
      ),
    );
  }
}
