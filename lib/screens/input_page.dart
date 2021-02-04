import 'package:bmi_calculator/constants.dart';
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
  int _weight = 60;
  int _age = 30;

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
                        _weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (_weight > 30) {
                                  _weight--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomRoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                if (_weight < 250) {
                                  _weight++;
                                }
                              });
                            },
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
                        _age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (_age > 10) {
                                  _age--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomRoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                if (_age < 100) {
                                  _age++;
                                }
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
          Container(
            color: kBottomButtonColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomButtonHeight,
          ),
        ],
      ),
    );
  }
}
