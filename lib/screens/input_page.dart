import 'dart:async';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_widgets/red_button.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:bmi_calculator/models/weight_age_buttons_logic.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../custom_widgets/icon_content.dart';
import '../custom_widgets/reusable_card.dart';
import '../models/gender_picking_logic.dart';
import '../custom_widgets/custom_round_icon_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderLogic genderCardLogic = GenderLogic();
  int _currentSliderValue = 180;

  Timer _timer;

  CustomButtonsLogic _weight =
      CustomButtonsLogic(value: 60, minValue: 30, maxValue: 250);
  CustomButtonsLogic _age =
      CustomButtonsLogic(value: 30, minValue: 10, maxValue: 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      genderCardLogic.selectedGender(gender: Gender.male);
                    });
                  },
                  color: genderCardLogic.changeCardState(gender: Gender.male),
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                    iconColor:
                        genderCardLogic.changeIconState(gender: Gender.male),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      genderCardLogic.selectedGender(gender: Gender.female);
                    });
                  },
                  color: genderCardLogic.changeCardState(gender: Gender.female),
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                    iconColor:
                        genderCardLogic.changeIconState(gender: Gender.female),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _currentSliderValue.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: _currentSliderValue.toDouble(),
                    min: 100,
                    max: 230,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        _weight.value.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRoundIconButton(
                            onLongPressed: () {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: kTimeInMs), (t) {
                                setState(() {
                                  _weight.decrementValue();
                                });
                              });
                            },
                            onLongPressedEnd: (LongPressEndDetails details) {
                              _timer.cancel();
                            },
                            onPressed: () {
                              setState(() {
                                _weight.decrementValue();
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomRoundIconButton(
                            onLongPressed: () {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: kTimeInMs), (t) {
                                setState(() {
                                  _weight.incrementValue();
                                });
                              });
                            },
                            onLongPressedEnd: (LongPressEndDetails details) {
                              _timer.cancel();
                            },
                            onPressed: () {
                              setState(() {
                                _weight.incrementValue();
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        _age.value.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onLongPressed: () {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: kTimeInMs), (t) {
                                setState(() {
                                  _age.decrementValue();
                                });
                              });
                            },
                            onLongPressedEnd: (LongPressEndDetails details) {
                              _timer.cancel();
                            },
                            onPressed: () {
                              setState(() {
                                _age.decrementValue();
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomRoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onLongPressed: () {
                              _timer = Timer.periodic(
                                  Duration(milliseconds: kTimeInMs), (t) {
                                setState(() {
                                  _age.incrementValue();
                                });
                              });
                            },
                            onLongPressedEnd: (LongPressEndDetails details) {
                              _timer.cancel();
                            },
                            onPressed: () {
                              setState(() {
                                _age.incrementValue();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          RedButton(
            onTap: () {
              if (genderCardLogic.isSelectedGender() == true) {
                CalculatorBrain calc = CalculatorBrain(
                    height: _currentSliderValue, weight: _weight.value);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                      resultTextStyle: calc.resultTextColor(),
                    ),
                  ),
                );
              }
            },
            buttonTitle: genderCardLogic.buttonText(),
          ),
        ],
      ),
    );
  }
}
