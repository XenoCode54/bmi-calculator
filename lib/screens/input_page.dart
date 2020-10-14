import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:bmi_calculator/components/calculateButton.dart';
import 'package:bmi_calculator/components/roundIconButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/gender.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var maleCard;
  int height = 180;
  int weight = 60;
  bool weightTap;
  int age = 17;

//  void colorSetter(Gender cardInput) {
//    if (cardInput == Gender.Male) {
//      if (maleCard == inactiveColor) {
//        maleCard = activeColor;
//        femaleCard = inactiveColor;
//      } else
//        maleCard = inactiveColor;
//    }
//    if (cardInput == Gender.Female) {
//      if (femaleCard == inactiveColor) {
//        femaleCard = activeColor;
//        maleCard = inactiveColor;
//      } else
//        femaleCard = inactiveColor;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: GenderChild(
                        gender: 'MALE',
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                      colour: maleCard == Gender.Male
                          ? kActiveColor
                          : kInactiveColor,
                      tap: () {
                        setState(() {
                          maleCard = Gender.Male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      tap: () {
                        setState(() {
                          maleCard = Gender.Female;
                        });
                      },
                      cardChild: GenderChild(
                        gender: 'FEMALE',
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                      colour: maleCard == Gender.Female
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: kMyText,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          height.toString(),
                          style: kMyNumber,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xff8d8398),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x24eb1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 230.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kMyText,
                          ),
                          Text(
                            weight.toString(),
                            style: kMyNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                pressed: () {
                                  setState(() {
                                    weightTap = false;
                                    weightTap ? weight++ : weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(
                                pressed: () {
                                  setState(() {
                                    //Haha! I know this logic is dumb
                                    weightTap = true;
                                    weightTap ? weight++ : weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kMyText,
                          ),
                          Text(
                            age.toString(),
                            style: kMyNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                pressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(
                                pressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CalculateButton(
              tap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: calc.result(),
                      bodyType: calc.bodyType(),
                      interpretation: calc.interpretation(),
                    ),
                  ),
                );
              },
              text: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
