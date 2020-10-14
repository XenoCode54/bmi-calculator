import 'package:flutter/material.dart';

import '../constants.dart';

class GenderChild extends StatelessWidget {
  final String gender;
  final IconData genderIcon;

  GenderChild({this.gender, this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: kMyText,
        )
      ],
    );
  }
}
