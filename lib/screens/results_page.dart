import 'package:bmi_calculator/components/calculateButton.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bodyType;
  final String bmi;
  final interpretation;

  ResultPage(
      {@required this.bodyType,
      @required this.bmi,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResultText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bodyType.toUpperCase(),
                      style: kResultBodyText,
                    ),
                    Text(
                      bmi,
                      style: kBMINumber,
                    ),
                    Text(
                      interpretation,
                      style: kInterpretation,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: CalculateButton(
                tap: () {
                  Navigator.pop(context);
                },
                text: 'RE-CALCULATE'),
          ),
        ],
      ),
    );
  }
}
