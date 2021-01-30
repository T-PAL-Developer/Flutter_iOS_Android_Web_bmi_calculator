import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../custom_widgets/icon_content.dart';
import '../custom_widgets/reusable_card.dart';
import '../models/gender_picking_logic.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderLogic genderCardLogic = GenderLogic();

  int _currentSliderValue = 180;

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
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
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
